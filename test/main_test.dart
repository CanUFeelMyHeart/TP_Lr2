import 'package:flutter_test/flutter_test.dart';
import 'package:shop/controllers.dart';

void main() {
  test('Add product to cart', () {
    final controller = ProductController();
    controller.addProductToCart(0);
    expect(controller.getProducts()[0].quantity, equals(19));
    expect(controller.getProducts()[0].soldQuantity, equals(1));
  });

  test('Remove product from cart', () {
    final controller = ProductController();
    controller.addProductToCart(0);
    controller.removeProductFromCart(0);
    expect(controller.getProducts()[0].quantity, equals(20));
    expect(controller.getProducts()[0].soldQuantity, equals(0));
  });

  test('Check price increase after 10 purchases', () {
    final controller = ProductController();
    for (int i = 0; i < 10; i++) {
      controller.addProductToCart(0);
    }
    expect(controller.getProducts()[0].price, equals(1000.0 * 1.15));
  });
}
