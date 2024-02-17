using Dapper;
using ShopProject.Entities;
using ShopProject.Repository;
using System.Data.SqlClient;

namespace ShopProject.Services
{
    public class ProductService
    {
        public ProductRepository ProductRepo { get; set; }

        public List<Product> GetAll()
        {
            var ProductList = ProductRepo.GetAll();
            return ProductList;
        }


        public void CreateProduct(Product product)
        {
            ProductRepo.Insert(product);
        }

        public void UpdateProduct(Product product)
        {
            var ProductList = GetAll();
            var targetProduct = ProductList.First(x => x.Id == product.Id);
            targetProduct.CategoryId = product.CategoryId;
            targetProduct.Title = product.Title;
            targetProduct.Name = product.Name;
            targetProduct.Description = product.Description;
            targetProduct.Price = product.Price;
            targetProduct.Color = product.Color;
        }

        public void DeleteProduct(int id)
        {
            var ProductList = GetAll();
            var targetProduct = ProductList.First(x => x.Id == id);

        }
    }
}
