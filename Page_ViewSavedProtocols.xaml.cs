using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace EMC07
{
    /// <summary>
    /// Interaction logic for Page_ViewSavedProtocol.xaml
    /// </summary>
    public partial class Page_ViewSavedProtocol : Page
    {
        private SavedProtocolsManager spm;

        /// <summary>
        /// Путь к сохраненным протоколам
        /// </summary>
        public static string pathSaved { get; set; }

        /// <summary>
        /// Флаг выделения всех элементов всписке
        /// </summary>
        private bool markedAll;

        public Page_ViewSavedProtocol()
        {
            InitializeComponent();

            // при значении -1 в списке не будет выделенных элементов
            SavedListBox.SelectedIndex = -1;
            
            // инициализируем объект менеджера сохраненных протоколов
            spm = new SavedProtocolsManager(pathSaved);
            this.DataContext = spm;

            // сразу сортируем список по линиям
            spm.SortListByLine();

            // в зависимости от направления сортировки меняем направление стрелки в заголовке столбца
            if (spm.SortDownLine)
            {
                btnLine.Style = (Style)btnLine.FindResource("HeadListButtonArrowDown");
            }
            else
            {
                btnLine.Style = (Style)btnLine.FindResource("HeadListButtonArrowUp");
            }

            markedAll = false;
            btnMarkAll.Content = "выделить всё";
        }

        private void EventSetter_OnHandler(object sender, MouseButtonEventArgs e)
        {
            string path = ((SavedProtocolsManager.SavedElement)((ListBoxItem) sender).Content).ProtocolPath;
            
            ViewProtocolController vpc = new ViewProtocolController(path);
            vpc.ShowProtocolPage();

            SavedListBox.SelectedIndex = -1;
        }
        
        private void btnClick(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;

            switch (btn.Name)
            {
                case "btnBack":
                    ((MainWindow)App.Current.MainWindow).btn_BackMenu();
                    break;

                case "btnDel":
                    if (SavedListBox.SelectedItems.Count != 0)
                    {
                        if (PW.Access(1))
                        {
                            if (Utl.YesNo("Удалить выбранные?"))
                            {
                                spm.DeleteMarked(SavedListBox.SelectedItems);
                            }
                        }
                        SavedListBox.SelectedIndex = -1;
                    }
                    break;

                case "btnMarkAll":

                    if (!markedAll)
                    {
                        SavedListBox.SelectAll();
                        markedAll = true;
                        btnMarkAll.Content = "снять выделение";
                    }
                    else
                    {
                        SavedListBox.UnselectAll();
                        markedAll = false;
                        btnMarkAll.Content = "выделить всё";
                    }
                    break;

                case "btnOpen":
                    if (SavedListBox.SelectedItems.Count != 0)
                    {
                        if (SavedListBox.SelectedItems.Count == 1)
                        {
                            ViewProtocolController vpc =
                                new ViewProtocolController(
                                    ((SavedProtocolsManager.SavedElement) SavedListBox.SelectedItems[0]).ProtocolPath);
                            vpc.ShowProtocolPage();

                            SavedListBox.SelectedIndex = -1;
                        }
                        else
                        {
                            Utl.Message("Для просмотра выберите только один протокол");
                        }
                    }
                    break;
            }
        }

        private void btnSort(object sender, RoutedEventArgs e)
        {
            if (SavedListBox.Items.Count != 0)
            {
                switch ((sender as Button).Name)
                {
                    case "btnLine":
                        spm.SortListByLine();

                        if (spm.SortDownLine) {
                            btnLine.Style = (Style)btnLine.FindResource("HeadListButtonArrowDown");
                        } else {
                            btnLine.Style = (Style)btnLine.FindResource("HeadListButtonArrowUp");
                        }

                        break;

                    case "btnPr":
                        spm.SortListByPr();

                        if (spm.SortDownPr) {
                            btnPr.Style = (Style)btnLine.FindResource("HeadListButtonArrowDown");
                        } else {
                            btnPr.Style = (Style)btnLine.FindResource("HeadListButtonArrowUp");
                        }

                        break;

                    case "btnName":
                        spm.SortListByName();

                        if (spm.SortDownName) {
                            btnName.Style = (Style)btnLine.FindResource("HeadListButtonArrowDown");
                        } else {
                            btnName.Style = (Style)btnLine.FindResource("HeadListButtonArrowUp");
                        }

                        break;

                    case "btnDate":
                        spm.SortListByDate();

                        if (spm.SortDownDate) {
                            btnDate.Style = (Style) btnLine.FindResource("HeadListButtonArrowDown");
                        } else {
                            btnDate.Style = (Style)btnLine.FindResource("HeadListButtonArrowUp");
                        }

                        break;

                    default:
                        spm.SortListByLine();
                        break;
                }
            }
        }
    }
}