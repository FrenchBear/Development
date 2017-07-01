using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Collections;
using System.Reflection;
using System.Windows.Controls.Primitives;

namespace CustomDataGrid
{
    public class CustomDataGrid : DataGrid
    {
        #region Constructors

        static CustomDataGrid()
        {
            Type ownerType = typeof(CustomDataGrid);
            DefaultStyleKeyProperty.OverrideMetadata(ownerType, new FrameworkPropertyMetadata(ownerType));
            ItemsPanelProperty.OverrideMetadata(ownerType, new FrameworkPropertyMetadata(new ItemsPanelTemplate(new FrameworkElementFactory(typeof(CustomDataGridRowsPresenter)))));
        }

        public CustomDataGrid()
        {
            this.Loaded += new RoutedEventHandler(CustomDataGrid_Loaded);
        }

        void CustomDataGrid_Loaded(object sender, RoutedEventArgs e)
        {
            CustomDataGridRowsPresenter panel = (CustomDataGridRowsPresenter)Helper.GetVisualChild<CustomDataGridRowsPresenter>(this);
            panel.InvalidateArrange();
        }        

        #endregion

        #region Frozen Rows

        /// <summary>
        /// Dependency Property fro FrozenRowCount Property
        /// </summary>
        public static readonly DependencyProperty FrozenRowCountProperty =
            DependencyProperty.Register("FrozenRowCount",
                                        typeof(int),
                                        typeof(DataGrid),
                                        new FrameworkPropertyMetadata(0,
                                                                      new PropertyChangedCallback(OnFrozenRowCountPropertyChanged),
                                                                      new CoerceValueCallback(OnCoerceFrozenRowCount)),
                                        new ValidateValueCallback(ValidateFrozenRowCount));

        /// <summary>
        /// Property which determines the number of rows which are frozen from 
        /// the beginning in order of display
        /// </summary>
        public int FrozenRowCount
        {
            get { return (int)GetValue(FrozenRowCountProperty); }
            set { SetValue(FrozenRowCountProperty, value); }
        }

        /// <summary>
        /// Coercion call back for FrozenRowCount property, which ensures that 
        /// it is never more that Item count
        /// </summary>
        /// <param name="d"></param>
        /// <param name="baseValue"></param>
        /// <returns></returns>
        private static object OnCoerceFrozenRowCount(DependencyObject d, object baseValue)
        {
            DataGrid dataGrid = (DataGrid)d;
            int frozenRowCount = (int)baseValue;

            if (frozenRowCount > dataGrid.Items.Count)
            {
                return dataGrid.Items.Count;
            }

            return baseValue;
        }

        /// <summary>
        /// Property changed callback fro FrozenRowCount
        /// </summary>
        /// <param name="d"></param>
        /// <param name="e"></param>
        private static void OnFrozenRowCountPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            CustomDataGridRowsPresenter panel = (CustomDataGridRowsPresenter)Helper.GetVisualChild<CustomDataGridRowsPresenter>(d as Visual);
            panel.InvalidateArrange();
            (d as DataGrid).UpdateLayout();
            panel.InvalidateArrange();
        }

        /// <summary>
        /// Validation call back for frozen row count
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static bool ValidateFrozenRowCount(object value)
        {
            int frozenCount = (int)value;
            return (frozenCount >= 0);
        }

        /// <summary>
        /// Dependency Property key for NonFrozenColumnsViewportHorizontalOffset Property
        /// </summary>
        private static readonly DependencyPropertyKey NonFrozenRowsViewportVerticalOffsetPropertyKey =
                DependencyProperty.RegisterReadOnly(
                        "NonFrozenRowsViewportVerticalOffset",
                        typeof(double),
                        typeof(DataGrid),
                        new FrameworkPropertyMetadata(0.0));

        /// <summary>
        /// Dependency property for NonFrozenRowsViewportVerticalOffset Property
        /// </summary>
        public static readonly DependencyProperty NonFrozenRowsViewportVerticalOffsetProperty = NonFrozenRowsViewportVerticalOffsetPropertyKey.DependencyProperty;

        /// <summary>
        /// Property which gets/sets the start y coordinate of non frozen rows in view port
        /// </summary>
        public double NonFrozenRowsViewportVerticalOffset
        {
            get
            {
                return (double)GetValue(NonFrozenRowsViewportVerticalOffsetProperty);
            }
            internal set
            {
                SetValue(NonFrozenRowsViewportVerticalOffsetPropertyKey, value);
            }
        }

        /// <summary>
        /// Method which gets called when Vertical scroll occurs on the scroll viewer of datagrid.
        /// Forwards the call to rows and header presenter.
        /// </summary>
        internal void OnVerticalScroll()
        {
            CustomDataGridRowsPresenter panel = (CustomDataGridRowsPresenter)Helper.GetVisualChild<CustomDataGridRowsPresenter>(this);
            panel.InvalidateArrange();
        }

        #endregion
    }
}
