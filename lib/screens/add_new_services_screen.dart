import 'package:autoaidv5_admin/core/components/default_button.dart';
import 'package:autoaidv5_admin/core/components/default_text_field.dart';
import 'package:autoaidv5_admin/cubits/services/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewServiceScreen extends StatelessWidget {
  AddNewServiceScreen({super.key});

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Service"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            DefaultTextField(controller: nameController, label: "Name"),
            const SizedBox(height: 20),
            DefaultTextField(controller: priceController, label: "Price"),
            const SizedBox(height: 20),
            BlocConsumer<ServicesCubit, ServicesState>(
              listener: (context, state) {
                if (state is SuccessMakeServices) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingMakeServices) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Create",
                  onPressed: () {
                    ServicesCubit.get(context)
                        .make(nameController.text, priceController.text);
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
