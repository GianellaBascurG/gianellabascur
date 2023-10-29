import 'package:flutter/material.dart';
import 'package:bascur_gianella/models/providers.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Listado provider;
  ProviderFormProvider(this.provider);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
