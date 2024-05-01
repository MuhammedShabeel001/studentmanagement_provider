import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/image_controller.dart';
import 'package:student_management_provider/widget/appbar.dart';
import 'package:student_management_provider/widget/textfields.dart';
// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final batchController = TextEditingController();
  // ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    final imagedata = Provider.of<Imagecontroller>(context);

    return Scaffold(
      appBar: myAppbar(context, 'Add Student'),
      body:Consumer(builder: (context, value, child) {
        return TextFieldWidget(
        formkey: formkey,
        imageController: imagedata,
        isFromEdit: false,
        nameController: nameController,
        phoneController: phoneController,
        batchController: batchController,
      );
      },) 
      
      ,
    
    );
  }
}
