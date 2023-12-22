class Product {
  String name;
  double price;
  int quantity;
  int soldQuantity;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    this.soldQuantity = 0,
  });
}
