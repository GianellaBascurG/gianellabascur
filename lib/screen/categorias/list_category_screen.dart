import 'package:flutter/material.dart';
import 'package:bascur_gianella/models/categories.dart';
import 'package:bascur_gianella/services/category_service.dart';
import 'package:bascur_gianella/widgets/category_card.dart';
import 'package:provider/provider.dart';
import 'package:bascur_gianella/screen/screen.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorias'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.SelectCategory =
                categoryService.categories[index].copy();
            Navigator.pushNamed(context, 'categories_edit');
          },
          child: CategoryCard(category: categoryService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory =
              Listado(categoryId: 0, categoryName: '', categoryState: '');
          Navigator.pushNamed(context, 'categories_edit');
        },
      ),
    );
  }
}
