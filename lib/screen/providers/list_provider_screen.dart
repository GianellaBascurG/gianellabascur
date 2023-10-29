import 'package:flutter/material.dart';
import 'package:bascur_gianella/models/providers.dart';
import 'package:bascur_gianella/services/provider_service.dart';
import 'package:bascur_gianella/widgets/provider_card.dart';
import 'package:provider/provider.dart' as p_l;
import 'package:bascur_gianella/screen/screen.dart';

class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = p_l.Provider.of<ProviderService>(context);
    if (providerService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.providers.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            providerService.SelectProvider =
                providerService.providers[index].copy();
            Navigator.pushNamed(context, 'providers_edit');
          },
          child: ProviderCard(provider: providerService.providers[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          providerService.SelectProvider = Listado(
              providerId: 0,
              providerName: '',
              providerLastName: '',
              providerMail: '',
              providerState: '');
          Navigator.pushNamed(context, 'providers_edit');
        },
      ),
    );
  }
}
