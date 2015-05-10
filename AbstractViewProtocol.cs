using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Windows.Controls;
using System.Xml;

namespace EMC07
{
    /// <summary>
    /// абстрактный класс,
    /// от которого наследуются другие классы,
    /// отвечающие за формирование и отображение протокола поверок
    /// </summary>
    abstract class AbstractViewProtocol
    {
        /// <summary>
        /// имя временного pdf файла,
        /// в который формируется протокол
        /// для его последующей печати через GhostScript
        /// </summary>
        public string PdfTempFileName = "tempPrint.pdf";

        /// <summary>
        /// Путь к xml файлу, в котором хранится конфигурация GhostScript
        /// </summary>
        private readonly string xmlGsParamsPath = AppDomain.CurrentDomain.BaseDirectory + "gs_params.xml";

        /// <summary>
        /// Свйоство, для получения екземпляра WebBrowser
        /// в классе потомке от AbstractViewProtocol
        /// </summary>
        public abstract WebBrowser GetBrowserControl { get; }

        /// <summary>
        /// Метод печати
        /// </summary>
        public abstract void Print();

        /// <summary>
        /// Метод сохранения протокола в pdf
        /// </summary>
        /// <param name="folderPath">путь к папке для сохранения</param>
        /// <param name="namePdf">имя pdf файла</param>
        public abstract void SaveAsPdf(string folderPath, string namePdf);

        /// <summary>
        /// Метода сохранения протокола "как есть"
        /// в формате html
        /// </summary>
        /// <param name="directory">путь к диреткории сохранения</param>
        /// <param name="filename">имя файла</param>
        public abstract void Save(string directory, string filename);

        public abstract void Dispose();

        /// <summary>
        /// Общий для всех потомков метод печати через GhostScript
        /// </summary>
        public void PrintProtocol()
        {
            string cmdFilePath = AppDomain.CurrentDomain.BaseDirectory + @"gs\gswin32c.exe";
            string parameters = readGsParametrs();

            if (File.Exists(cmdFilePath))
            {
                ProcessStartInfo psi = new ProcessStartInfo();
                psi.Arguments = parameters;
                psi.FileName = cmdFilePath;
                psi.UseShellExecute = false;

                Process printProcess = Process.Start(psi);
                printProcess.WaitForExit(10000);

                if (printProcess.HasExited == false)
                {
                    printProcess.Kill();
                }
            }
            else
            {
                Console.WriteLine("\nException: {0} doesn't exist!", cmdFilePath);
            }
        }

        /// <summary>
        /// Метод чтения конфигурации GhostScript
        /// из внешнего xml файла
        /// </summary>
        /// <returns>строка с конфигурацией GS</returns>
        private string readGsParametrs()
        {
            StringBuilder gsParams = new StringBuilder();

            if (File.Exists(xmlGsParamsPath))
            {
                using (XmlReader xmlReader = XmlReader.Create(xmlGsParamsPath))
                {
                    try
                    {
                        while (xmlReader.Read())
                        {
                            if (xmlReader.NodeType == XmlNodeType.Element)
                            {
                                if (xmlReader.Name == "withoutParams")
                                {
                                    XmlReader xReader = xmlReader.ReadSubtree();

                                    while (xReader.Read())
                                    {
                                        if (xReader.Name == "param")
                                        {
                                            if (xReader.HasAttributes)
                                            {
                                                gsParams.Append(xReader.GetAttribute("par"));
                                                gsParams.Append(" ");
                                            }
                                        }
                                    }

                                    xReader.Close();
                                }
                                else if (xmlReader.Name == "withParams")
                                {
                                    XmlReader xReader = xmlReader.ReadSubtree();

                                    while (xReader.Read())
                                    {
                                        if (xReader.Name == "param")
                                        {
                                            if (xReader.HasAttributes)
                                            {
                                                string paramName = xReader.GetAttribute("name");

                                                if (paramName.Equals("-sDEVICE"))
                                                {
                                                    gsParams.Append(paramName);
                                                    gsParams.Append("=");
                                                    gsParams.Append(xReader.GetAttribute("par"));
                                                    gsParams.Append(" ");

                                                    if (!(xReader.GetAttribute("resolution")).Equals(""))
                                                    {
                                                        gsParams.Append(xReader.GetAttribute("resolution"));
                                                        gsParams.Append(" ");
                                                    }
                                                }
                                                else if (paramName.Equals("-sOutputFile"))
                                                {
                                                    if ((xReader.GetAttribute("par")).Equals("%printer%"))
                                                    {
                                                        gsParams.Append(paramName);
                                                        gsParams.Append("=");
                                                        gsParams.Append("\"");
                                                        gsParams.Append((xReader.GetAttribute("par")));
                                                        gsParams.Append(
                                                            EngineerMenu.PCnsType_ViewModel.GetDefaultPrinterName);
                                                        gsParams.Append("\"");
                                                        gsParams.Append(" ");
                                                    }
                                                    else
                                                    {
                                                        gsParams.Append(paramName);
                                                        gsParams.Append("=");
                                                        gsParams.Append((xReader.GetAttribute("par")));
                                                        gsParams.Append(" ");
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Exception while read xml gs parametrs: {0}", ex);
                    }

                    xmlReader.Close();
                }
            }

            gsParams.Append(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, PdfTempFileName));
            gsParams.Append(" ");

            return gsParams.ToString();
        }
    }
}
