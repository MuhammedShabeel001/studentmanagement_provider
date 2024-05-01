import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/edit_controller.dart';
import 'package:student_management_provider/functions/controller/image_controller.dart';
import 'package:student_management_provider/model/student_model.dart';
import 'package:student_management_provider/widget/appbar.dart';
import 'package:student_management_provider/widget/textfields.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  EditStudent({super.key, this.editController,this.studentDetails});
  EditController? editController;
  StudentModel? studentDetails;

  // EditController editController = Get.put(EditController());
  Imagecontroller imageController = Imagecontroller();
  // StudentModelController student = StudentModelController();

  final GlobalKey<FormState> keyedit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final imagedata = Provider.of<Imagecontroller>(context);
    return Scaffold(
      appBar: myAppbar(context, 'Edit Student'),
      body: Consumer<EditController>(
        builder: (context, value, child) {
          return TextFieldWidget(
            formkey: keyedit,
            imageController: imagedata,
            isFromEdit: true,
            nameController: value.namecontroller,
            phoneController: value.phonecontroller,
            batchController: value.batchcontroller,
            editController: value,
          );
        },
      ),
     
    );
  }
}
