using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;
using System.Diagnostics;
using System.Windows.Controls.Primitives;

namespace DataGrid_FrozenRowSample
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        #region Private Data

        private IEditableCollectionView iecv;

        #endregion Private Data

        public Window1()
        {
            InitializeComponent();

            DataGrid_Standard.ItemsSource = new People();
            

            ICollectionView view = CollectionViewSource.GetDefaultView(DataGrid_Standard.ItemsSource);
            iecv = (IEditableCollectionView)view;

            // used for data binding
            this.NewItemPlaceholderPositionCB.DataContext = iecv;
        }

        #region Events       

        private void OnIncrementButtonClick(object sender, RoutedEventArgs e)
        {
            DataGrid_Standard.FrozenColumnCount++;
        }

        private void OnDecrementButtonClick(object sender, RoutedEventArgs e)
        {
            DataGrid_Standard.FrozenColumnCount--;
        }

        private void OnIncrementFrozenRowButtonClick(object sender, RoutedEventArgs e)
        {
            DataGrid_Standard.FrozenRowCount++;
            DataGrid_Standard.InvalidateMeasure();
            DataGrid_Standard.InvalidateArrange();
        }

        private void OnDecrementFrozenRowButtonClick(object sender, RoutedEventArgs e)
        {
            DataGrid_Standard.FrozenRowCount--;
        }


        private void templateButtonClick(object sender, RoutedEventArgs e)
        {
            Debug.WriteLine("template button pressed");
        }

        // shows each format of copied content on the clipboard
        private void OnDebugClipboardButtonClick(object sender, RoutedEventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            IDataObject ido = Clipboard.GetDataObject();
            string[] formats = ido.GetFormats();
            foreach (string format in formats)
            {
                sb.Append("======================================" + Environment.NewLine);
                object data = ido.GetData(format);
                sb.Append(data);
                sb.Append("======================================" + Environment.NewLine);

                Debug.WriteLine(data);
            }

            MessageBox.Show(sb.ToString());
        }

        private void OnClearClipboardButtonClick(object sender, RoutedEventArgs e)
        {
            Clipboard.Clear();
        }        

        private void OnDebugButtonClick1(object sender, RoutedEventArgs e)
        {
            //TODO: add any debugging behavior here     
        }

        private void OnDebugButtonClick2(object sender, RoutedEventArgs e)
        {
            //TODO: add any debugging behavior here            
        }

        #endregion Events

        #region Helpers

        #region GetCell

        public DataGridCell GetCell(int row, int column)
        {
            DataGridRow rowContainer = GetRow(row);
            if (rowContainer != null)
            {
                DataGridCellsPresenter presenter = GetVisualChild<DataGridCellsPresenter>(rowContainer);

                // try to get the cell but it may possibly be virtualized
                DataGridCell cell = (DataGridCell)presenter.ItemContainerGenerator.ContainerFromIndex(column);
                if (cell == null)
                {
                    // now try to bring into view and retreive the cell
                    DataGrid_Standard.ScrollIntoView(rowContainer, DataGrid_Standard.Columns[column]);

                    cell = (DataGridCell)presenter.ItemContainerGenerator.ContainerFromIndex(column);
                }

                return cell;
            }

            return null;
        }

        #endregion GetCell

        #region GetRow

        /// <summary>
        /// Gets the DataGridRow based on the given index
        /// </summary>
        /// <param name="index">the index of the container to get</param>
        public DataGridRow GetRow(int index)
        {
            DataGridRow row = (DataGridRow)DataGrid_Standard.ItemContainerGenerator.ContainerFromIndex(index);
            if (row == null)
            {
                // may be virtualized, bring into view and try again
                DataGrid_Standard.ScrollIntoView(DataGrid_Standard.Items[index]);

                row = (DataGridRow)DataGrid_Standard.ItemContainerGenerator.ContainerFromIndex(index);
            }

            return row;
        }

        #endregion GetRow

        #region GetRowHeader

        /// <summary>
        /// Gets the DataGridRowHeader based on the row index.
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        public DataGridRowHeader GetRowHeader(int index)
        {
            return GetRowHeader(GetRow(index));
        }

        /// <summary>
        /// Returns the DataGridRowHeader based on the given row.
        /// </summary>
        /// <param name="row">Uses reflection to access and return RowHeader</param>
        public DataGridRowHeader GetRowHeader(DataGridRow row)
        {
            if (row != null)
            {
                return GetVisualChild<DataGridRowHeader>(row);
            }
            return null;
        }

        #endregion GetRowHeader

        #region GetColumnHeader

        public DataGridColumnHeader GetColumnHeader(int index)
        {
            DataGridColumnHeadersPresenter presenter = GetVisualChild<DataGridColumnHeadersPresenter>(DataGrid_Standard);

            if (presenter != null)
            {
                return (DataGridColumnHeader)presenter.ItemContainerGenerator.ContainerFromIndex(index);
            }

            return null;
        }

        #endregion GetColumnHeader

        #region GetVisualChild

        public T GetVisualChild<T>(Visual parent) where T : Visual
        {
            T child = default(T);

            int numVisuals = VisualTreeHelper.GetChildrenCount(parent);
            for (int i = 0; i < numVisuals; i++)
            {
                Visual v = (Visual)VisualTreeHelper.GetChild(parent, i);
                child = v as T;
                if (child == null)
                {
                    child = GetVisualChild<T>(v);
                }
                if (child != null)
                {
                    break;
                }
            }

            return child;
        }

        #endregion GetVisualChild

        #region FindPartByName

        public DependencyObject FindPartByName(DependencyObject ele, string name)
        {
            DependencyObject result;
            if (ele == null)
            {
                return null;
            }
            if (name.Equals(ele.GetValue(FrameworkElement.NameProperty)))
            {
                return ele;
            }

            int numVisuals = VisualTreeHelper.GetChildrenCount(ele);
            for (int i = 0; i < numVisuals; i++)
            {
                DependencyObject vis = VisualTreeHelper.GetChild(ele, i);
                if ((result = FindPartByName(vis, name)) != null)
                {
                    return result;
                }
            }
            return null;
        }

        #endregion FindPartByName

        #endregion Helpers        
    }
}
