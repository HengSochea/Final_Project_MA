import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'Store.dart';
void main() => runApp(
    DevicePreview(
        builder:(context) =>
            CategoryFormApp()
    )
);

class CategoryFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Form',
      debugShowCheckedModeBanner: false,
      home: CategoryForm(),
    );
  }
}

Future<List> _getProduct() async {
  var url = Uri.parse("http://127.0.0.1:5050/products");
  var response = await http.get(url);
  final data = jsonDecode(response.body);
  return data; // Return the list of products
}

class CategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Your Order Your Food!",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              "Phnom Penh, Cambodia",
              style: TextStyle(color: Colors.brown, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('bg3.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.5), BlendMode.dstOver), // Optional: Add overlay color
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color with transparency
                      offset: Offset(0, 4), // Horizontal and vertical offset of the shadow
                      blurRadius: 10, // Blur radius to make the shadow softer
                      spreadRadius: 1, // Spread radius to make the shadow larger
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Get special discount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Up to 40% off",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      'https://static.vecteezy.com/system/resources/previews/048/034/386/non_2x/fast-food-board-with-hamburger-french-fries-isolated-on-transparent-background-free-png.png',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find your food",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Category Buttons as Containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // First Category (All Foods)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to a new screen (replace with your own screen)
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FakeStore()), // Replace with your desired screen
                          );
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.food_bank,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "All Foods",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),


                  // Second Category (Pizza)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.local_pizza,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Pizza",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // Third Category (Dessert)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.cake,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Dessert",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  // Fourth Category (Chicken)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.hot_tub,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Chicken",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // Popular Food Section
              const Text(
                "Popular food",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List>(
                  future: _getProduct(), // Fetch the products from your API or database
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No products available"));
                    }

                    var products = snapshot.data!; // The list of products returned by the API/database

                    return GridView.builder(
                      itemCount: 4, // You can change this to products.length if you want to display all products
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        var product = products[index]; // Get the product at the current index
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.network(
                                    product['image'], // Use the actual image URL from your API or database
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['title'], // Use the actual product title
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "\$${product['price'].toStringAsFixed(2)}", // Use the actual price
                                      style: const TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
