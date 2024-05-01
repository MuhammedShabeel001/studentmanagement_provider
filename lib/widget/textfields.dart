import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_management_provider/functions/common/common_functions.dart';
import 'package:student_management_provider/functions/controller/edit_controller.dart';
import 'package:student_management_provider/functions/controller/image_controller.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final GlobalKey formkey;
  Imagecontroller imageController;
  final bool isFromEdit;
  final EditController? editController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController batchController;

  TextFieldWidget({
    super.key,
    required this.formkey,
    required this.imageController,
    required this.isFromEdit,
    required this.nameController,
    required this.phoneController,
    required this.batchController,
    this.editController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isFromEdit == true
          ? FloatingActionButton.extended(
              onPressed: () {
                update(
                  context,
                  editController?.id,
                  editController?.namecontroller.value,
                  editController?.phonecontroller.value,
                  editController?.batchcontroller.value,
                  formkey,
                  imageController,
                  editController,
                  context,
                );
                log('message updated');
              },
              label: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            )
          : FloatingActionButton.extended(
              onPressed: () {
                addstudent(nameController, phoneController, batchController,
                    imageController, formkey, context);
                log('message');
              },
              label: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),

      // floatingActionButton: flo,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      isFromEdit == true
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: imageController.istrue == true
                                  ? FileImage(imageController.image1)
                                  : editController!.image != null
                                      ? FileImage(File(editController!.image!))
                                      : const AssetImage(
                                              'assets/images/graduated.png')
                                          as ImageProvider,
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: imageController.istrue == true
                                  ? FileImage(imageController.image1)
                                  : const AssetImage(
                                          'assets/images/graduated.png')
                                      as ImageProvider,
                            ),
                      Positioned(
                        bottom: -10,
                        right: -12,
                        child: IconButton(
                            onPressed: () {
                              pickimages(imageController, context);
                            },
                            icon: const Icon(Icons.add_a_photo)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            15), // Limit to 15 characters
                      ],
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          suffix: const Icon(Icons.person),
                          label: const Text('Name'),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(12),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          10), // Limit to 10 characters
                    ],
                    controller: phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      suffix: const Icon(Icons.phone),
                      label: const Text('Phone'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          6), // Limit to 6 characters
                    ],
                    controller: batchController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the batch';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      suffix: const Icon(Icons.group),
                      label: const Text('Batch'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
