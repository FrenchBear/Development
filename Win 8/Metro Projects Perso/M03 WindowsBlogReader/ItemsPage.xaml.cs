using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Items Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234233

namespace WindowsBlogReader
{
    /// <summary>
    /// A page that displays a collection of item previews.  In the Split Application this page
    /// is used to display and select one of the available groups.
    /// </summary>
    public sealed partial class ItemsPage : WindowsBlogReader.Common.LayoutAwarePage
    {
        public ItemsPage()
        {
            this.InitializeComponent();
        }

        /// <summary>
        /// Populates the page with content passed during navigation.  Any saved state is also
        /// provided when recreating a page from a prior session.
        /// </summary>
        /// <param name="navigationParameter">The parameter value passed to
        /// <see cref="Frame.Navigate(Type, Object)"/> when this page was initially requested.
        /// </param>
        /// <param name="pageState">A dictionary of state preserved by this page during an earlier
        /// session.  This will be null the first time a page is visited.</param>
        protected override async void LoadState(Object navigationParameter, Dictionary<String, Object> pageState)
        {
            FeedDataSource feedDataSource = (FeedDataSource)App.Current.Resources["feedDataSource"];
            if (feedDataSource != null)
            {
                if (feedDataSource.Feeds.Count == 0)
                {
                    await feedDataSource.GetFeedsAsync();
                }
                this.DefaultViewModel["Items"] = feedDataSource.Feeds;
            }
        }

        private void ItemView_ItemClick(object sender, ItemClickEventArgs e)
        {
            // Navigate to the split page, configuring the new page
            // by passing the clicked item (FeedItem) as a navigation parameter
            this.Frame.Navigate(typeof(SplitPage), e.ClickedItem);
        }
    }
}
