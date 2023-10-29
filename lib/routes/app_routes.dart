import 'package:bascur_gianella/screen/categorias/edit_category_screen.dart';
import 'package:bascur_gianella/screen/categorias/list_category_screen.dart';

import 'package:bascur_gianella/screen/home_screen.dart';
import 'package:bascur_gianella/screen/providers/edit_provider_screen.dart';
import 'package:bascur_gianella/screen/providers/list_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:bascur_gianella/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'home': (BuildContext context) => HomePage(),
    'products_list': (BuildContext context) => const ListProductScreen(),
    'products_edit': (BuildContext context) => const EditProductScreen(),
    'categories_list': (BuildContext context) => const ListCategoryScreen(),
    'categories_edit': (BuildContext context) => const EditCategoryScreen(),
    'providers_list': (BuildContext context) => const ListProviderScreen(),
    'providers_edit': (BuildContext context) => const EditProviderScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
