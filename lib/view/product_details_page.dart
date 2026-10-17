import 'package:flutter/material.dart';
import 'package:mechine_test/model/products_model.dart';
import 'package:mechine_test/view_model/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          Container(
            height: 300,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              product.image ?? '',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  size: 60,
                  color: Colors.grey,
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Category
          Text(
            product.category?.toUpperCase() ?? 'PRODUCT',
            style: const TextStyle(
              color: Color(0xFF16A34A),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 10),

          // Product Name
          Text(
            product.title ?? 'Product Name',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          // Price
          Text(
            '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16A34A),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            product.description ?? 'No description available.',
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 30),

          // Add to Cart Button
          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<CartProvider>().addToCart(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to cart successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
