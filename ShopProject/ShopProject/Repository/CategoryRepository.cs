using Dapper;
using ShopProject.Entities;
using System.Data.SqlClient;

namespace ShopProject.Repository
{
    public class CategoryRepository
    {
        public List<Category> GetAll()
        {
            string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ShopProject;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            using var cn = new SqlConnection(connectionString);
            var sql = $"Select * from dbo.Categories";
            var cmd = new CommandDefinition(sql);
            var result = cn.Query<Category>(cmd);
            return result.ToList();
        }
    }
}
