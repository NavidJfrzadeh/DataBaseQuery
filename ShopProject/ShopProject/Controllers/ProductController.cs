using Microsoft.AspNetCore.Mvc;
using ShopProject.Entities;
using ShopProject.Repository;

namespace ShopProject.Controllers
{
    public class ProductController : Controller
    {
        public ProductRepository ProductRepo { get; set; } = new ProductRepository();
        public CategoryRepository CategoryRepo { get; set; } = new CategoryRepository();
        public IActionResult Index()
        {
            var products = new List<Product>();
            products = ProductRepo.GetAll();
            return View(products);
        }


        public IActionResult ProductDetails(int id)
        {
            var products = new List<Product>();
            var categories = CategoryRepo.GetAll();
            products = ProductRepo.GetAll();
            categories = CategoryRepo.GetAll();

            var targetProduct = products.First(x => x.Id == id);
            var Category = categories.First(x => x.Id == targetProduct.CategoryId);

            ViewBag.Category = Category.Name;
            return View(targetProduct);
        }

        public IActionResult AddProductView()
        {
            ViewBag.Categories = CategoryRepo.GetAll();
            return View();
        }


        [HttpPost]
        public IActionResult AddProduct(Product newProduct)
        {
            ProductRepo.Insert(newProduct);
            return RedirectToAction("Index");
        }


        public IActionResult EditProduct(int id)
        {
            var products = new List<Product>();
            products = ProductRepo.GetAll();
            var targetProduct = products.First(x => x.Id == id);
            ViewBag.Categories = CategoryRepo.GetAll();
            return View(targetProduct);
        }

        [HttpPost]
        public IActionResult EditProduct(Product product)
        {
            ProductRepo.Update(product);
            return RedirectToAction("Index");
        }



        public IActionResult DeleteProduct(int id)
        {
            ProductRepo.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
