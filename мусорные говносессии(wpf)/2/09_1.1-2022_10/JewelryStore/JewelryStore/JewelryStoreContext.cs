using Microsoft.EntityFrameworkCore;
using System.Data.Entity;
using DbContext = System.Data.Entity.DbContext;

namespace JewelryStore
{
    public class JewelryStoreContext : DbContext
    {
        public Microsoft.EntityFrameworkCore.DbSet<Product> Products { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=JewelryStore;Integrated Security=True");
        }
    }
}
