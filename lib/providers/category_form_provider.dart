import 'package:flutter/material.dart';
import 'package:bascur_gianella/models/categories.dart';

class CategoryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado category;
  CategoryFormProvider(this.category);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
