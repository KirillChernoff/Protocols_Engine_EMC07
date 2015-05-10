using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Media;
using System.Xml;
using EMC07.Resources;

namespace EMC07
{
    /// <summary>
    /// Класс, отвечающий за отображение
    /// списков сохраненных протоколов и работу с ними
    /// </summary>
    public class SavedProtocolsManager
    {
        /// <summary>
        /// коллекция, хранящая список объектов SavedElement
        /// </summary>
        private ObservableCollection<SavedElement> _listSavedElements;

        public ObservableCollection<SavedElement> ListSavedElements
        {
            get { return _listSavedElements; }
        }

        private string _dir;

        /// <summary>
        /// Контсруктор класса
        /// Инициализирует объект коллекции и заполняет ее
        /// </summary>
        /// <param name="directory"></param>
        public SavedProtocolsManager(string directory)
        {
            _dir = directory;
            _listSavedElements = new ObservableCollection<SavedElement>();

            CreateNamesDictionary();

            CreateDataList();
        }

        private Dictionary<string, string> FilesDictionary = new Dictionary<string, string>();

        /// <summary>
        /// Метод заполняет коллекцию списком файлов,
        /// находящихся в данной директории
        /// имя файла - ключ
        /// полный путь к файлу - значение
        /// </summary>
        /// <returns>true/false существование директории</returns>
        private bool CreateFilesList()
        {
            DirectoryInfo di = new DirectoryInfo(_dir);

            bool dirExist;

            if (di.Exists)
            {
                foreach (FileInfo fileInfo in di.GetFiles())
                {
                    string fName = fileInfo.Name;
                    string fullPath = Path.Combine(_dir, fName);

                    FilesDictionary.Add(fName, fullPath);
                }

                dirExist = true;
            }
            else
            {
                dirExist = false;
            }

            return dirExist;
        }

        /// <summary>
        /// Метод заполняет коллекцию
        /// элементами SavedElement
        /// </summary>
        private void CreateDataList()
        {
            if (CreateFilesList())
            {
                foreach (var file in FilesDictionary)
                {
                    string protName;
                    string protLine;
                    string protPr;
                    string protDate;
                    FormatName(file.Key, out protName, out protLine, out protPr, out protDate);

                    _listSavedElements.Add(new SavedElement(protName, protLine, protPr, protDate, file.Value));
                }
            }
        }

        /// <summary>
        /// Коллекция имен протоколов
        /// </summary>
        private Dictionary<string, string> namesDictionary = new Dictionary<string, string>();

        /// <summary>
        /// Путь к xml файлу с соответствиями
        /// код протокола - имя протокола
        /// </summary>
        private string xmlNamesPath = AppDomain.CurrentDomain.BaseDirectory + @"TemplatesProtocolHtml\NamesData.xml";

        /// <summary>
        /// Метод формирует словарь из
        /// код протокола - имя протокола
        /// </summary>
        private void CreateNamesDictionary()
        {
            if (File.Exists(xmlNamesPath))
            {
                using (XmlReader reader = XmlReader.Create(xmlNamesPath))
                {
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element)
                        {
                            if (reader.Name == "Name")
                            {
                                if (reader.HasAttributes)
                                {
                                    namesDictionary.Add(reader.GetAttribute("Code"), reader.GetAttribute("Text"));
                                }
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Метод парсит имя файла
        /// и возвращает значения для SavedElement
        /// </summary>
        /// <param name="fileName">Имя файла</param>
        /// <param name="name">имя протокола</param>
        /// <param name="line">номер линии</param>
        /// <param name="pr">тип расходомера</param>
        /// <param name="date">дата создания</param>
        private void FormatName(string fileName, out string name, out string line, out string pr, out string date)
        {
            StringBuilder sbName = new StringBuilder();
            StringBuilder sbLine = new StringBuilder();
            StringBuilder sbPr = new StringBuilder();
            StringBuilder sbDate = new StringBuilder();

            fileName = fileName.Replace(".html", "");

            string[] splitStr = fileName.Split('_');

            if (splitStr.Length == 4)
            {
                foreach (var code in namesDictionary)
                {
                    if (splitStr[0].Equals(code.Key))
                    {
                        sbName.Append(code.Value);
                    }
                }

                switch (splitStr[1])
                {
                    case "VM":
                        sbPr.Append(CommonRes.VM);
                        break;
                    case "MM":
                        sbPr.Append(CommonRes.MM);
                        break;
                    case "RVM":
                        sbPr.Append(CommonRes.RVM);
                        break;
                    default:
                        sbPr.Append(CommonRes.VM);
                        break;
                }
                sbDate.Append(splitStr[2]);

                sbLine.Append(splitStr[3].Trim('L'));
            }
            else
            {
                sbName.Append("NoName");
                sbPr.Append("VM");
                sbDate.Append(DateTime.Now.ToShortDateString());
                sbLine.Append("1");
            }
            name = sbName.ToString();
            line = sbLine.ToString();
            pr = sbPr.ToString();
            date = sbDate.ToString();
        }

        /// <summary>
        /// Метод удаляет отмеченный протокол из директории
        /// и элемент из отображаемого списка
        /// </summary>
        /// <param name="toDelList">список из которого удаляется элемент</param>
        public void DeleteMarked(IList toDelList)
        {
            while (toDelList.Count > 0)
            {
                SavedElement saved = (SavedElement)toDelList[0];

                if (_listSavedElements.Contains(saved))
                {
                    File.Delete((saved).ProtocolPath);
                    _listSavedElements.Remove(saved);
                }
            }
        }

        /// <summary>
        /// флаг сортировки в прямом или обратном порядке
        /// </summary>
        public bool SortDownLine = true;

        /// <summary>
        /// сортировка списка по номеру линии
        /// </summary>
        public void SortListByLine()
        {
            for (int i = 1; i < _listSavedElements.Count; i++)
            {
                var curValue = _listSavedElements[i];
                int pos = i;

                if (SortDownLine)
                {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolPr +
                                           curValue.ProtocolDate) > 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                } else {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolPr +
                                           curValue.ProtocolDate) < 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                }

                _listSavedElements[pos] = curValue;
            }

            SortDownLine = !SortDownLine;
        }

        public bool SortDownDate = true;

        public void SortListByDate()
        {
            for (int i = 1; i < _listSavedElements.Count; i++)
            {
                var curValue = _listSavedElements[i];
                int pos = i;

                if (SortDownDate)
                {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolDate +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolPr).CompareTo(
                                           curValue.ProtocolDate +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolPr) > 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                } else {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolDate +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolPr).CompareTo(
                                           curValue.ProtocolDate +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolPr) < 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                }

                _listSavedElements[pos] = curValue;
            }

            SortDownDate = !SortDownDate;
        }

        public bool SortDownName = true;

        public void SortListByName()
        {
            for (int i = 1; i < _listSavedElements.Count; i++)
            {
                var curValue = _listSavedElements[i];
                int pos = i;

                if (SortDownName)
                {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolName +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolPr +
                                           curValue.ProtocolDate) > 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                }
                else
                {

                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolName +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolPr +
                                           curValue.ProtocolDate) < 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                }

                _listSavedElements[pos] = curValue;
            }

            SortDownName = !SortDownName;
        }

        public bool SortDownPr = true;

        /// <summary>
        /// сортировка по типу преобразователя
        /// </summary>
        public void SortListByPr()
        {
            for (int i = 1; i < _listSavedElements.Count; i++)
            {
                var curValue = _listSavedElements[i];
                int pos = i;

                if (SortDownPr)
                {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolPr +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolDate) > 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                } else {
                    while (pos > 0 && (_listSavedElements[pos - 1].ProtocolPr +
                                       _listSavedElements[pos - 1].ProtocolLine +
                                       _listSavedElements[pos - 1].ProtocolName +
                                       _listSavedElements[pos - 1].ProtocolDate).CompareTo(
                                           curValue.ProtocolPr +
                                           curValue.ProtocolLine +
                                           curValue.ProtocolName +
                                           curValue.ProtocolDate) < 0)
                    {
                        _listSavedElements[pos] = _listSavedElements[pos - 1];
                        pos = pos - 1;
                    }
                }

                _listSavedElements[pos] = curValue;
            }

            SortDownPr = !SortDownPr;
        }
        
        /// <summary>
        /// Класс хранит всю информацию по сохраненному протоколу
        /// </summary>
        public class SavedElement : INotifyPropertyChanged
        {
            /// <summary>
            /// Имя протокола
            /// </summary>
            private string _protocolName;
            public string ProtocolName
            {
                get { return _protocolName; }
            }

            /// <summary>
            /// Номер линии, которой принадлежит протокол
            /// </summary>
            private string _protocolLine;
            public string ProtocolLine
            {
                get { return _protocolLine; }
            }

            /// <summary>
            /// Расходомер для которого сделан протокол
            /// </summary>
            private string _protocolPr;
            public string ProtocolPr
            {
                get { return _protocolPr; }
            }

            /// <summary>
            /// Дата формирования протокола
            /// </summary>
            private string _protocolDate;
            public string ProtocolDate
            {
                get { return _protocolDate; }
            }

            /// <summary>
            /// Путь к протоколу на диске
            /// </summary>
            private string _protocolPath;
            public string ProtocolPath
            {
                get { return _protocolPath; }
            }

            public SavedElement(string name, string line, string pr, string date, string path)
            {
                _protocolName = name;
                _protocolLine = line;
                _protocolPr = pr;
                _protocolDate = date;
                _protocolPath = path;
            }

            public event PropertyChangedEventHandler PropertyChanged;

            protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
            {
                PropertyChangedEventHandler handler = PropertyChanged;
                if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
