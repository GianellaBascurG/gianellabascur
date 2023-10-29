import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.category),
              onPressed: () {
                Navigator.pushNamed(context, 'categories_list');
              },
              label: Text('Administrar Categorías'),
            ),
            const SizedBox(width:10),
            ElevatedButton.icon(
              icon: const Icon(Icons.inventory_2),
              onPressed: () {
                Navigator.pushNamed(context, 'products_list');
              },
              label: Text('Administrar Productos'),
            ),
            const SizedBox(width:10),
            ElevatedButton.icon(
              icon: const Icon(Icons.apartment),
              onPressed: () {
                Navigator.pushNamed(context, 'providers_list');
              },
              label: Text('Administrar Proveedores'),
            ),
            const SizedBox(width:10),
          ],
        ),
      ),
    );
  }
}