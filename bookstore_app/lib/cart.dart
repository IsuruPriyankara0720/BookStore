import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Sample cart items (replace with your actual data)
  final List<CartItem> _cartItems = [
    CartItem(
      image: 'assets/image1.jpg', // Replace with your image path
      name: 'DRACULA',
      price: 2000,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/image2.jpg', // Replace with your image path
      name: 'BIRD BOX',
      price: 1500,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/image3.jpg', // Replace with your image path
      name: 'THE HUNGER',
      price: 1800,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700], // Blue app bar
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
        
        
        title: const Text('Cart'), // You can customize the title
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(item.image, height: 80), // Adjust height as needed
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text('Rs ${item.price.toStringAsFixed(2)}'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text(item.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Rs ${_calculateTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Make button full width
                backgroundColor: Colors.greenAccent[700], // Blue checkout button
                      foregroundColor: Colors.white,
              ),
              child: const Text('NEXT', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final String image;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}