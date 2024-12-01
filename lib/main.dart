import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clothing App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'T-Shirt',
      'image':
          'https://cdn.pixabay.com/photo/2024/04/29/04/21/tshirt-8726716_640.jpg',
      'description': 'A comfortable cotton T-Shirt.',
      'price': '\$20',
    },
    {
      'name': 'Jeans',
      'image':
          'https://www.montecarlo.in/cdn/shop/products/5220850960DN-1-26_1-1P5-122943-p0H.jpg?v=1696686728',
      'description': 'Stylish blue jeans.',
      'price': '\$40',
    },
    {
      'name': 'Sneakers',
      'image':
          'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?cs=srgb&dl=pexels-melvin-buezo-1253763-2529148.jpg&fm=jpg',
      'description': 'Trendy sneakers for everyday wear.',
      'price': '\$60',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('206057'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Increased to fit more boxes in a row
          mainAxisSpacing: 6.0, // Reduced spacing between rows
          crossAxisSpacing: 6.0, // Reduced spacing between columns
          childAspectRatio: 3 / 4, // Adjusted to make boxes less tall
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Expanded(
              flex: 1, // Occupies 1/3 of the width
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16), // Space between image and details
            // Details section
            Expanded(
              flex: 2, // Occupies 2/3 of the width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    product['description'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: ${product['price']}',
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
