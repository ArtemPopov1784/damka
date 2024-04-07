using System.Windows;

namespace JewelryStore
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            // Авторизация пользователя
            if (AuthUser(LoginTextBox.Text, PasswordBox.Password))
            {
                // Открыть окно со списком товаров
                ProductsWindow productsWindow = new ProductsWindow();
                productsWindow.Show();
                this.Close();
            }
            else
            {
                ErrorMessageTextBlock.Text = "Неверный логин или пароль";
            }
        }

        private bool AuthUser(string login, string password)
        {
            // Проверка логина и пароля (заглушка)
            return login == "admin" && password == "password";
        }
    }
}
