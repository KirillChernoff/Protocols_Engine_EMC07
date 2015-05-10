using System;
using System.Drawing.Printing;
using System.IO;
using System.Text;
using System.Windows.Controls;
using mshtml;
using Pechkin;

namespace EMC07
{
    class ViewSavedProtocol : AbstractViewProtocol
    {
        private WebBrowser _webBrowser;

        private StringBuilder _strBuilder;

        /// <summary>
        /// Конструктор класса
        /// Создает новый обеъкт WebBrowser,
        /// в который передает ссылку/путь на сохраненный протокол
        /// </summary>
        /// <param name="url">ссылка/путь к сохраненному протоколу</param>
        public ViewSavedProtocol(string url)
        {
            _webBrowser = new WebBrowser();
            _webBrowser.Navigate(url);

            _strBuilder = new StringBuilder();
        }

        /// <summary>
        /// Свойство возвращает объект WebBrowser
        /// </summary>
        public override WebBrowser GetBrowserControl
        {
            get
            {
                return _webBrowser;
            }
        }

        /// <summary>
        /// Метод конвертирует html код из WebBrowser в pdf файл
        /// </summary>
        /// <param name="pdfName">имя pdf файла</param>
        /// <param name="folderPath">путь к директории сохранения</param>
        private void HtmlToPdf(string pdfName, string folderPath = null)
        {
            HTMLDocument document = (HTMLDocument)_webBrowser.Document;
            _strBuilder.Append(document.documentElement.outerHTML);
            
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
        
        public override void Save(string directory, string filePath)
        {
            //не зачем повторно сохранять то, что уже сохранено
            Utl.Message("протокол уже сохранен");
        }

        public override void Dispose()
        {
            if (_webBrowser != null)
            {
                _webBrowser.Dispose();
                _webBrowser = null;
            }

            if (_strBuilder.Length != 0)
            {
                _strBuilder.Clear();
                _strBuilder = null;
            }
        }

        private readonly object _thislock = new object();
    }
}
