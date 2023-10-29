import 'package:bascur_gianella/services/provider_service.dart';
import 'package:flutter/material.dart';
import 'package:bascur_gianella/providers/provider_form_provider.dart';
import 'package:provider/provider.dart';

import '../../ui/input_decorations.dart';

class EditProviderScreen extends StatelessWidget {
  const EditProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProviderFormProvider(providerService.SelectProvider!),
        child: _ProviderScreenBody(
          providerService: providerService,
        ));
  }
}

class _ProviderScreenBody extends StatelessWidget {
  const _ProviderScreenBody({
    Key? key,
    required this.providerService,
  }) : super(key: key);

  final ProviderService providerService;
  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar/Crear proveedor'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _ProviderForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;
              await providerService.deleteProvider(
                  providerForm.provider, context);
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save_alt_outlined),
            onPressed: () async {
              if (!providerForm.isValidForm()) return;
              await providerService.editOrCreateProvider(providerForm.provider);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class _ProviderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerForm = Provider.of<ProviderFormProvider>(context);
    final provider = providerForm.provider;
    bool switchValue = provider.providerState == "Activo";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: providerForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: provider.providerName,
                onChanged: (value) => provider.providerName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el nombre es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre',
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: provider.providerLastName,
                onChanged: (value) => provider.providerLastName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el apellido es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido',
                  labelText: 'Apellido',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: provider.providerMail,
                onChanged: (value) => provider.providerMail = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el mail es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Mail',
                  labelText: 'MAil',
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                  provider.providerState = value ? "Activo" : "bloqueado";
                },
                activeColor: Color.fromARGB(255, 80, 112, 163),
                title: const Text('Disponible'),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}
