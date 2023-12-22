import 'package:shop/model.dart';


class ProductController {
  List<Product> products = [
    Product(name: 'Laptop', price: 1000.0, quantity: 20),
    Product(name: 'Smartphone', price: 500.0, quantity: 15),
    
  ];

  void addProductToCart(int index) {
    if (index >= 0 && index < products.length && products[index].quantity > 0) {
      products[index].quantity--;
      products[index].soldQuantity++;

      if (products[index].soldQuantity % 10 == 0) {
        // Увеличение цены на 15% после покупки 10 экземпляров
        products[index].price *= 1.15;
      }
    }
  }

  void removeProductFromCart(int index) {
    if (index >= 0 && index < products.length && products[index].soldQuantity > 0) {
      products[index].quantity++;
      products[index].soldQuantity--;

      if (products[index].soldQuantity % 10 == 9) {
        // Вернуть цену к исходной после возврата 9 экземпляров
        products[index].price /= 1.15;
      }
    }
  }

  double getTotalPrice() {
    return products.fold(0.0, (total, product) => total + (product.price * product.soldQuantity));
  }

  List<Product> getProducts() {
    return products;
  }
}
