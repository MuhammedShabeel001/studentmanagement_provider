import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/image_controller.dart';
import 'package:student_management_provider/functions/controller/student_controller.dart';
import 'package:student_management_provider/model/student_model.dart';
import 'package:student_management_provider/widget/snakbar.dart';

pickimages(Imagecontroller imageController, context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.amber.shade500,
        content: const Text(
          'Photo options',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                imageController.fromcamera(context);
              },
              child: const Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
            onPressed: () {
              imageController.fromgallery(context);
            },
            child: const Text(
              'Gallery',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );
    },
  );
}



Future<void> addstudent(namecontroller, phonecontroller,
    batchcontroller, imagecontroller, formkey, context) async {
  final control = Provider.of<StudentModelController>(context, listen: false);
  final name = namecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final batch = batchcontroller.text.trim();

  if (formkey.currentState!.validate() && imagecontroller.istrue != false) {
    final studentvalues = StudentModel(
      name: name,
      phone: phone,
      batch: batch,
      image: imagecontroller.image,
    );

    await control.addstudent1(studentvalues);
    namecontroller.text = '';
    phonecontroller.text = '';
    batchcontroller.text = '';
    imagecontroller.setbool(false);
    Navigator.of(context).pop();
    snackbar('Submitted', context);
  } else {
    snackbar('Please add your photo', context);
  }
}


Future<void> update(
    ctx,
    id,
    namecontroller,
    phonecontroller,
    batchcontroller,
    keyedit,
    imageController,
    editcontroller,
    context) async {
  final name = namecontroller.text.trim();
  final phone = phonecontroller.text.trim();
  final batch = batchcontroller.text.trim();

  if (keyedit.currentState!.validate()) {
    await Provider.of<StudentModelController>(context, listen: false).updatestudent(
      id,
      name,
      phone,
      batch,
      imageController.istrue ? imageController.image : editcontroller.image,
    );
    Navigator.of(context).pop();
    editcontroller.namecontroller.text = '';
    editcontroller.phonecontroller.text = '';
    editcontroller.batchcontroller.text = '';
    imageController.setbool(false);

    snackbar('Updated', context);
  }}

// Future<void> update(
//     ctx,
//     id,
//     namecontroller,
//     phonecontroller,
//     batchcontroller,
//     keyedit,
//     imageController,
//     editcontroller,
//     context) async {
//   final name = namecontroller?.text?.trim() ?? '';
//   final phone = phonecontroller?.text?.trim() ?? '';
//   final batch = batchcontroller?.text?.trim() ?? '';

//   if (keyedit?.currentState?.validate() ?? false) {
//     final image = imageController?.istrue == true
//         ? imageController.image
//         : editcontroller?.image;
    
//     await Provider.of<StudentModelController>(context, listen: false)
//         .updatestudent(id, name, phone, batch, image);
    
//     Navigator.of(context).pop();
    
//     editcontroller?.namecontroller?.text = '';
//     editcontroller?.phonecontroller?.text = '';
//     editcontroller?.batchcontroller?.text = '';
//     imageController?.setbool(false);

//     snackbar('Updated', context);
//   } else {
//     snackbar('Validation failed', context);
//   }
// }
