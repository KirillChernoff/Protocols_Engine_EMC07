using System;
using System.Data;
using System.Windows.Controls;

namespace EMC07
{
    /// <summary>
    /// Класс контроллера для просмотра протоколов поверок
    /// 
    /// Класс используется для делегирования работы
    /// по формированию протокола поверки,
    /// его отображения, печати и сохранения
    /// </summary>
    class ViewProtocolController
    {
        private static AbstractViewProtocol _webView;

        private static WebBrowser _webBrowser;
        
        public static WebBrowser WebBrowserControl
        {
            get { return _webBrowser; }
        }

        private static string _path;
        private static string _name;

        /// <summary>
        /// Конструктор класса ViewProtocolController,
        /// создающий объект VerificationProtocol,
        /// который формирует протокол из переданных данных и возвращает объект WebBrowser
        /// для отображения протокола на экране
        /// </summary>
        /// <param name="data">данные для протокола</param>
        /// <param name="tempPath">путь к xslt шаблону, который будет заполнен данными</param>
        /// <param name="savePath">путь для сохранения протокола</param>
        /// <param name="saveName">имя протокола при сохранении</param>
        public ViewProtocolController(DataSet data, string tempPath, string savePath = null, string saveName = null)
        {
            _webView = new VerificationProtocol(data, tempPath);
            _webBrowser = _webView.GetBrowserControl;

            _path = savePath;
            _name = saveName;
        }

        /// <summary>
        /// Конструктор класса ViewProtocolController,
        /// создающий объект ViewSavedProtocol,
        /// который возвращает объект WebBrowser для отображения протокола с заданного пути
        /// </summary>
        /// <param name="protocolUrl">путь к сохраненному протоколу</param>
        public ViewProtocolController(string protocolUrl)
        {
            _webView = new ViewSavedProtocol(protocolUrl);
            _path = protocolUrl;
            _webBrowser = _webView.GetBrowserControl;
        }

        /// <summary>
        /// Метод показа протокола
        /// Метод формирует объект Win_ViewProtocol,
        /// который в отдельном окне отображает контрол браузера и сам протокол
        /// </summary>
        /// <param name="bShowSaveButton">задает отображение кнопки сохранения</param>
        public void ShowProtocolPage(bool bShowSaveButton = true)
        {
            if (_webBrowser != null)
            {
                Win_ViewProtocol wvp = new Win_ViewProtocol();
                wvp.bShowSaveBtn = bShowSaveButton;
                wvp.ShowDialog();
            }
        }

        /// <summary>
        /// Метод сохранения протокола в pdf
        /// задает уникальное имя для протокола и
        /// вызывает метод SaveAsPdf,
        /// определенный в классе наследнике от AbstractViewProtocol
        /// </summary>
        public static void PrintPdf()
        {
            string[] directories = _path.Split(System.IO.Path.DirectorySeparatorChar);
            string pdfName;

            if (directories.Length > 0)
                pdfName = string.Format("{0}_{1}", directories[directories.Length - 1], System.IO.Path.GetFileNameWithoutExtension(_name));
            else
                pdfName = DateTime.Now.ToString().Replace(".", "").Replace(":", "").Replace(" ", "");

            _webView.SaveAsPdf(AppDomain.CurrentDomain.BaseDirectory + Resources.CommonRes.PdfFolderName, string.Format("{0}.pdf", pdfName));

        }

        /// <summary>
        /// Метод печати протокола через GhostScript
        /// вызывает метод Print,
        /// определенный в классе наследнике от AbstractViewProtocol
        /// </summary>
        public static void Print()
        {
            _webView.Print();
        }

        /// <summary>
        /// Метод сохранения протокола
        /// для возможности повторного просмотра
        /// вызывает метод Save,
        /// определенный в классе наследнике от AbstractViewProtocol
        /// </summary>
        public static void SaveProtocol()
        {
            if (System.IO.File.Exists(_path + "\\" + _name))
            {
                if (Utl.YesNo("Протокол был сохранен ранее.\r\nПерезаписать?"))
                    _webView.Save(_path, _name);
            }
            else
                _webView.Save(_path, _name);
        }

        public static void Dispose()
        {
            _webBrowser = null;

            _webView.Dispose();
            _webView = null;
        }
    }
}
