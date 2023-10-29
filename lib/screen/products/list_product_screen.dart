import 'package:flutter/material.dart';
import 'package:bascur_gianella/models/products.dart';
import 'package:bascur_gianella/services/product_service.dart';
import 'package:bascur_gianella/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:bascur_gianella/screen/screen.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de productos'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            productService.SelectProduct =
                productService.products[index].copy();
            Navigator.pushNamed(context, 'products_edit');
          },
          child: ProductCard(product: productService.products[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
              productId: 0,
              productName: '',
              productPrice: 0,
              productImage:
                  'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
              productState: '');
          Navigator.pushNamed(context, 'products_edit');
        },
      ),
    );
  }
}
