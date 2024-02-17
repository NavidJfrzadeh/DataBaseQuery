using Dapper;
using ShopProject.Entities;
using System.Data.SqlClient;

namespace ShopProject.Repository
{
    public class ProductRepository
    {
        public List<Product> GetAll()
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ShopProject;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            using var cn = new SqlConnection(connectionString);
            var sql = $"Select * from dbo.Products";
            var cmd = new CommandDefinition(sql);
            var result = cn.Query<Product>(cmd);
            return result.ToList();
        }


        public void Insert(Product model)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ShopProject;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            string sql = "Insert dbo.Products(CategoryId,Title,Name,Description,Price,Color)Values(@CategoryId,@Title,@Name,@Description,@Price,@Color)";
            using var cn = new SqlConnection(connectionString);
            var command = new CommandDefinition(sql, model);
            cn.Execute(command);
        }

        public void Update(Product model)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ShopProject;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            string sql = "UPDATE dbo.Products SET CategoryId = @CategoryId,Title = @Title,Name = @Name,Description = @Description,Price = @Price,Color = @Color WHERE Id = @Id;";
            using var cn = new SqlConnection(connectionString);
            var command = new CommandDefinition(sql, model);
            cn.Execute(command);
        }


        public void Delete(int id)
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ShopProject;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            var sql = "DELETE FROM dbo.Products WHERE Id = @Id";
            using var cn = new SqlConnection(connectionString);
            var command = new CommandDefinition(sql, new { Id = id });
            cn.Execute(command);
        }
    }
}
