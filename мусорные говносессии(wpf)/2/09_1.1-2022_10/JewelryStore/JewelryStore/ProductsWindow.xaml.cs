using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Windows;

namespace JewelryStore
{
    public partial class ProductsWindow : Window
    {
        private JewelryStoreContext _context;
        private ObservableCollection<Product> _products;

        public ProductsWindow()
        {
            InitializeComponent();
            _context = new JewelryStoreContext();
            _products = new ObservableCollection<Product>(_context.Products.ToList());
            ProductsDataGrid.ItemsSource = _products;
        }

        private void AddProduct_Click(object sender, RoutedEventArgs e)
        {
            AddEditProductWindow addEditProductWindow = new AddEditProductWindow();
            addEditProductWindow.ShowDialog();

            if (addEditProductWindow.DialogResult == true)
            {
                _context.Products.Add(addEditProductWindow.Product);
                _context.SaveChanges();
                _products.Add(addEditProductWindow.Product);
            }
        }

        private void Logout_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
