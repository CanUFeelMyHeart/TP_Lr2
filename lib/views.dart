// product_view.dart
import 'package:flutter/material.dart';
import 'package:shop/controllers.dart';

// product_view.dart
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  final ProductController controller;

  ProductView({required this.controller});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics Store'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.controller.getProducts().length,
              itemBuilder: (context, index) {
                var product = widget.controller.getProducts()[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${product.price.toStringAsFixed(2)}'),
                      Text('Available: ${product.quantity}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          widget.controller.addProductToCart(index);
                          setState(() {});
                        },
                      ),
                      Text(product.soldQuantity.toString()),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          widget.controller.removeProductFromCart(index);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Total Cost'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Total: \$${widget.controller.getTotalPrice().toStringAsFixed(2)}'),
                        SizedBox(height: 8),
                        Text('Thank you for shopping with us!'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Show Total Cost'),
          ),
          //SizedBox(height: 16),
          Text(
            'Total Purchase: \$${widget.controller.getTotalPrice().toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
