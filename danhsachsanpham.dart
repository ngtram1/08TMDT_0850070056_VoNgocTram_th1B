import 'package:flutter/material.dart';

// Product model class (you can define your product class accordingly)
class Product {
  String name;
  String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class ProductListScreen extends StatelessWidget {
  // Sample list of products (you can replace this with your own data)
  final List<Product> products = [
    Product(
      name: 'Hoa Hồng',
      imageUrl:
      'https://hoatuoihoamy.com/wp-content/uploads/2020/09/hoa-hong-do-dep.jpg', // Replace with actual image URL
    ),
    Product(
      name: 'Hoa Tulip',
      imageUrl:
      'https://banhoatulip.files.wordpress.com/2014/01/hoa-tulip-6.jpg', // Replace with actual image URL
    ),
    Product(
      name: 'Hoa cẩm tú cầu',
      imageUrl:
      'https://hoachianh.com/wp-content/uploads/2021/02/e2155e7357c0a89ef1d1-1.jpg', // Replace with actual image URL
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            leading: Image.network(products[index].imageUrl),
            onTap: () {
              // Navigate to the product detail screen when a product is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('Tên: ${product.name}'),
            Image.network(
              product.imageUrl,

            ),
            Text('Tên: ${product.name}'),
            // Add more details about the product here
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListScreen(),
  ));
}
