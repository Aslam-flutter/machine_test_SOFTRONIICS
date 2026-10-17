import 'package:flutter/material.dart';
import 'package:mechine_test/view/cart_page.dart';
import 'package:mechine_test/view_model/product_provider.dart';
import 'package:provider/provider.dart';

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;
    debugPrint('Products count: ${products.length}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF16A34A),
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Discover Products',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Find something you love.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search products by title...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                context.read<ProductProvider>().searchProducts(value);
              },
            ),

            const SizedBox(height: 22),

            const Text(
              'Popular Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 14),

            Consumer<ProductProvider>(
              builder: (context, provider, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = provider.filteredProducts[index];

                    return ProductCard(product: product);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.network(
                product.image,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF16A34A),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  product.title ?? product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 17),
                    const SizedBox(width: 4),
                    const Text('Popular', style: TextStyle(fontSize: 12)),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
