using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Media;
using System.Windows.Navigation;
using System.ComponentModel;

namespace EMC07
{
    /// <summary>
    /// Interaction logic for Win_ViewProtocol.xaml
    /// </summary>
    public partial class Win_ViewProtocol : Window, INotifyPropertyChanged
    {
        /// <summary>
        /// флаг отображения кнопки сохранения
        /// </summary>
        public bool bShowSaveBtn { get; set; } //Отобразить кнопку сохранения
        private WebBrowser _browser;

        public Win_ViewProtocol()
        {
            InitializeComponent();

            this.Width = App.Current.MainWindow.Width;
            this.Height = App.Current.MainWindow.Height;

            this.Left = App.Current.MainWindow.Left;
            this.Top = App.Current.MainWindow.Top;

            _browser = ViewProtocolController.WebBrowserControl;

            _browser.LoadCompleted += BrowserOnLoadCompleted;

            // добавляем на сетку контрол WebBrowser,
            // полученный от класса ViewProtocolController
            WebBrowserGrid.Children.Add(_browser);

            OnPropertyChanged("bShowSaveBtn");
        }

        private void Print_Click(object sender, RoutedEventArgs e)
        {
            if (PW.Access(1) && Utl.YesNo("Печатать?"))
            {
                switch (EngineerMenu.PC.PrintWaySlType.V)
                {
                    case 0:
                        ViewProtocolController.Print();
                        break;
                    case 1:
                        ViewProtocolController.PrintPdf();
                        break;
                    default:
                        ViewProtocolController.PrintPdf();
                        break;
                }
            }
        }

        private void BtnExitViewProtocol_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (PW.Access(1) && Utl.YesNo("Сохранить протокол?"))
            {
                ViewProtocolController.SaveProtocol();
            }
        }

        private void Win_ViewProtocol_OnLoaded(object sender, RoutedEventArgs e)
        {
            GridButton.DataContext = this;
        }

        private void Win_ViewProtocol_OnUnloaded(object sender, RoutedEventArgs e)
        {
            ViewProtocolController.Dispose();
        }

        #region Блок модификации скрола браузера

        mshtml.HTMLDocument htmlDoc;
        int HeightWebFull;
        int HeightWebView;
        int HeightWebMaximum;
        int dH;

        private void BrowserOnLoadCompleted(object sender, NavigationEventArgs navigationEventArgs)
        {
            // модифицируем контрол WebBrowser
            // для нормального отображения под WPF
            ModifyWebBrowser(ref _browser);

            // модифицируем скролл контрола WebBrowser
            // для нормального отображения под WPF
            ModifyScrollBar(ref webScrollBar);
        }

        /// <summary>
        /// Метод модификации WebBrowser для отображения под WPF
        /// </summary>
        /// <param name="webbrowser"></param>
        private void ModifyWebBrowser(ref WebBrowser webbrowser)
        {
            htmlDoc = webbrowser.Document as mshtml.HTMLDocument;

            mshtml.IHTMLDocument2 doc2 = (mshtml.IHTMLDocument2)webbrowser.Document;
            mshtml.IHTMLDocument3 doc3 = (mshtml.IHTMLDocument3)webbrowser.Document;
            mshtml.IHTMLElement2 body2 = (mshtml.IHTMLElement2)doc2.body;
            mshtml.IHTMLElement2 root2 = (mshtml.IHTMLElement2)doc3.documentElement;

            HeightWebView = root2.scrollHeight;
            HeightWebFull = body2.scrollHeight;
            HeightWebMaximum = Math.Max(HeightWebView, HeightWebFull);

            dH = HeightWebMaximum / 20;
        }

        /// <summary>
        /// Метод модификации скрола WebBrowser для отображения под WPF
        /// </summary>
        /// <param name="scrollbar"></param>
        private void ModifyScrollBar(ref ScrollBar scrollbar)
        {
            scrollbar.Minimum = 0;
            scrollbar.Maximum = HeightWebMaximum;
            scrollbar.ViewportSize = HeightWebView;

            FrameworkElement fe = VisualTreeHelper.GetChild(this.webScrollBar, 0) as FrameworkElement;
            if (fe == null)
                return;

            Grid grdVScroll_new = VisualTreeHelper.GetChild(fe, 0) as Grid; ;
            RepeatButton buttonRepeat;
            buttonRepeat = grdVScroll_new.Children[0] as RepeatButton;
            buttonRepeat.Click += new RoutedEventHandler(buttonUpRepeat_Click);

            buttonRepeat = grdVScroll_new.Children[2] as RepeatButton;
            buttonRepeat.Click += new RoutedEventHandler(buttonDownRepeat_Click);
        }

        void buttonUpRepeat_Click(object sender, RoutedEventArgs e)
        {
            if (webScrollBar.Value - dH <= 0)
                webScrollBar.Value = 0;
            else
                webScrollBar.Value -= dH;
        }

        void buttonDownRepeat_Click(object sender, RoutedEventArgs e)
        {
            if (webScrollBar.Value + dH > webScrollBar.Maximum)
                webScrollBar.Value = webScrollBar.Maximum;
            else
                webScrollBar.Value += dH;
        }

        private void webScrollBar_Scroll(object sender, ScrollEventArgs e)
        {
            if (htmlDoc != null)
                htmlDoc.parentWindow.scrollTo(0, (int)webScrollBar.Value);
        }

        #endregion

        protected void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
        }
        public event PropertyChangedEventHandler PropertyChanged;
    }
}
