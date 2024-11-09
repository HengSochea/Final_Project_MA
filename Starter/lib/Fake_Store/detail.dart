import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'cart_item.dart';

class DetailScreen extends StatefulWidget {
  final int data;
  final void Function(CartItem item) addToCart;

  // Constructor to accept data
  DetailScreen({required this.data, required this.addToCart});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1; // Default quantity

  // Fetch product details from API
  Future<Map> _getProductDetail() async {
    var url = Uri.parse("http://127.0.0.1:5050/products/${widget.data}");
    var respone = await http.get(url);
    final data = jsonDecode(respone.body);
    return data;
  }

  // Increase quantity
  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // Decrease quantity (but not below 1)
  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<Map>(
        future: _getProductDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 5,
              ),
            ); // Loading spinner
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            ); // Error handling
          } else if (snapshot.hasData) {
            var rating = snapshot.data!['rating'] != null ? snapshot.data!['rating']['rate'] ?? 0.0 : 0.0;
            var product = snapshot.data!;

            return Column(
              children: [
                // Product Image
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Product Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // This will space out the title and price
                    children: [
                      // Product Title
                      Expanded(
                        child: Text(
                          product['title'],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),

                      // Product Price with background like button
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        // Adds padding to make it look like a button
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          // Background color for the price container
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Text(
                          "\$${product['price'].toStringAsFixed(2)}",
                          // Formatting the price
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Product Description

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft, // Align to the left
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Align children to the left
                      children: [
                        Text(
                          'About',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          product['description'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Spacer to push the quantity and add to cart button to the bottom
                Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Displaying stars based on rating
                      for (int i = 1; i <= 5; i++)
                        Icon(
                          Icons.star,
                          color: i <= rating ? Colors.orange : Colors.grey,
                          size: 24,
                        ),
                      SizedBox(width: 8),
                      // Showing the rating value on the right
                      Text(
                        "$rating / 5",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                // Row with Quantity and Add to Cart Button at the Bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity selector
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _decreaseQuantity,
                            color: Colors.blue,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              '$_quantity',
                              key: ValueKey<int>(_quantity),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _increaseQuantity,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      // Add to Cart Button
                      ElevatedButton(
                        onPressed: () {
                          CartItem item = CartItem(
                            // id: product['id'],
                            title: product['title'],
                            price: product['price'],
                            image: product['image'],
                            quantity: _quantity,
                          );
                          // Call the addToCart function passed from the main screen
                          widget.addToCart(item);

                          // Show confirmation
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Added $_quantity ${product['title']} to the cart',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          } else {
            return Center(
              child: Text("No data found"),
            );
          }
        },
      ),
    );
  }
}
