import 'dart:io';

import 'package:autoaidv5_admin/core/components/default_button.dart';
import 'package:autoaidv5_admin/core/components/default_text_field.dart';
import 'package:autoaidv5_admin/cubits/carCenter/car_center_cubit.dart';
import 'package:autoaidv5_admin/cubits/services/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCarCenterScreen extends StatefulWidget {
  AddNewCarCenterScreen({super.key});

  @override
  State<AddNewCarCenterScreen> createState() => _AddNewCarCenterScreenState();
}

class _AddNewCarCenterScreenState extends State<AddNewCarCenterScreen> {
  final nameController = TextEditingController();

  final rateController = TextEditingController();
  final addressController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Car Center"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              image == null
                  ? const CircleAvatar(
                      radius: 70,
                    )
                  : CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(File(image!.path)),
                    ),
              const SizedBox(height: 10),
              DefaultButton(
                label: "Choose Image",
                onPressed: () async {
                  image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              DefaultTextField(controller: nameController, label: "Name"),
              const SizedBox(height: 20),
              DefaultTextField(controller: addressController, label: "Address"),
              const SizedBox(height: 20),
              DefaultTextField(controller: rateController, label: "Rate"),
              const SizedBox(height: 20),
              BlocConsumer<CarCenterCubit, CarCenterState>(
                listener: (context, state) {
                  if (state is SuccessMakeCarCenter) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingMakeCarCenter) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return DefaultButton(
                    label: "Create",
                    onPressed: () {
                      CarCenterCubit.get(context).make(nameController.text,
                          addressController.text, rateController.text, image!);
                      // ServicesCubit.get(context)
                      //     .make(nameController.text, rateController.text);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
