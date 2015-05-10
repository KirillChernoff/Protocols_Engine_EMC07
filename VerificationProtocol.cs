using System;
using System.Data;
using System.Drawing.Printing;
using System.IO;
using System.Text;
using System.Windows.Controls;
using System.Xml;
using System.Xml.Xsl;
using Pechkin;

namespace EMC07
{
    class VerificationProtocol : AbstractViewProtocol
    {
        private WebBrowser _webBrowser;
        
        private DataSet _dataProtocol;
        private string _templatePath;

        private StringBuilder _strBuilder;

        /// <summary>
        /// Конструктор класса
        /// Вызывает private метод Make для формирования протокола
        /// </summary>
        /// <param name="dataProtocol">Данные протокола</param>
        /// <param name="templatePath">Путь к шаблону протокола</param>
        public VerificationProtocol(DataSet dataProtocol, string templatePath)
        {
            _dataProtocol = dataProtocol;
            _templatePath = templatePath;

            _strBuilder = new StringBuilder();

            Make();
        }

        /// <summary>
        /// Свойство возвращает новый объект WebBrowser
        /// в который уже в виде строки, содержащей код html, загружен протокол
        /// </summary>
        public override WebBrowser GetBrowserControl
        {
            get
            {
                try
                {
                    _webBrowser = new WebBrowser();
                    _webBrowser.NavigateToString(_strBuilder.ToString());
                }
                catch
                {
                    _webBrowser = null;
                }

                return _webBrowser;
            }
        }

        /// <summary>
        /// Метод заполняет xsl шаблон данными,
        /// переданными через конструктор класса
        /// </summary>
        private void Make()
        {
            if (!File.Exists(_templatePath))
            {
                Utl.MessageEr("Файл шаблона поверки не найден", "Проверьте наличие файла " + _templatePath);
            }
            else
            {
                XslCompiledTransform xslCompiled = new XslCompiledTransform();
                XmlReaderSettings xmlSettings = new XmlReaderSettings();
                xmlSettings.ValidationType = ValidationType.None;

                XmlReader reader = null;

                try
                {
                    xslCompiled.Load(XmlReader.Create(_templatePath, xmlSettings));

                    reader = new XmlTextReader(new StringReader(_dataProtocol.GetXml()));

                    xslCompiled.Transform(reader, null, new StringWriter(_strBuilder));
                }
                catch
                {
                     Utl.MessageEr(string.Format("Ошибка шаблона! \r\n {0}",_templatePath));
                }
                finally
                {
                    if (reader!=null)
                        reader.Close();
                }
            }
        }

        /// <summary>
        /// Метод конвертирует html код в pdf файл
        /// Используется библиотека Pechkin
        /// </summary>
        /// <param name="pdfName">имя pdf файла</param>
        /// <param name="folderPath">путь к директории сохранения</param>
        private void HtmlToPdf(string pdfName, string folderPath = null)
        {
            GlobalConfig globalConfig = new GlobalConfig();

            globalConfig
                .SetMargins(EngineerMenu.PC.PrinterTopMarg, EngineerMenu.PC.PrinterRightMarg, EngineerMenu.PC.PrinterBottomMarg, EngineerMenu.PC.PrinterLeftMarg)
                .SetDocumentTitle("PdfDoc")
                .SetPaperSize(PaperKind.A4);

            IPechkin pechkin = new SimplePechkin(globalConfig);

            byte[] pdfBufferBytes = pechkin.Convert(_strBuilder.ToString());

            if (folderPath != null)
            {
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                File.WriteAllBytes(folderPath + @"\" + pdfName, pdfBufferBytes);
            }
            else
            {
                File.WriteAllBytes(pdfName, pdfBufferBytes);
            }
        }

        /// <summary>
        /// Метод сохраняет отображаемый протокол
        /// в виде файла с html разметкой
        /// </summary>
        /// <param name="directory">путь к директории сохранения</param>
        /// <param name="filename">имя файла</param>
        public override void Save(string directory, string filename)
        {
            lock (_thislock)
            {
                try
                {
                    DirectoryInfo dirInfo = new DirectoryInfo(directory);

                    if (!dirInfo.Exists)
                    {
                        dirInfo.Create();
                    }

                    // ограничение на количество файлов в папке с протоколами
                    if ((dirInfo.GetFiles()).Length >= 50)
                    {
                        Utl.Message("Нет места для сохранения!\nПожалуйста удалите старые протоколы");
                    }
                    else
                    {
                        string fullPath = directory + @"\" + filename;

                        using (FileStream fs = new FileStream(fullPath, FileMode.Create, FileAccess.ReadWrite))
                        {
                            using (StreamWriter sw = new StreamWriter(fs))
                            {
                                sw.Write(_strBuilder.ToString());
                            }
                        }
                    }
                }
                catch (Exception exception)
                {
                    Console.WriteLine("Can't save protocol! Error: {0}", exception);
                }
            }
        }

        /// <summary>
        /// Печать протокола на принтер через GhostScript
        /// Вызывается метод из AbstractViewProtocol
        /// </summary>
        public override void Print()
        {
            lock (_thislock)
            {
                HtmlToPdf(Path.Combine(AppDomain.CurrentDomain.BaseDirectory , PdfTempFileName));
                PrintProtocol();
            }
        }

        /// <summary>
        /// Метод сохранения протокола в pdf
        /// </summary>
        /// <param name="folderPath">директория сохранения</param>
        /// <param name="namePdf">имя файла</param>
        public override void SaveAsPdf(string folderPath, string namePdf)
        {
            lock (_thislock)
            {
                HtmlToPdf(namePdf, folderPath);
            }
        }

        public override void Dispose()
        {
            if (_webBrowser != null)
            {
                _webBrowser.Dispose();
                _webBrowser = null;
            }

            _strBuilder.Clear();
            _strBuilder = null;

            _dataProtocol.Dispose();
            _dataProtocol = null;
            _templatePath = string.Empty;
        }

        private readonly object _thislock = new object();
    }
}
