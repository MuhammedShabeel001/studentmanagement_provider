import 'package:flutter/material.dart';
import 'package:student_management_provider/model/student_model.dart';

class EditController extends ChangeNotifier {
  void oninit(StudentModel data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _id = data.id!;
      _image = data.image;
      _namecontroller.text = data.name;
      _phonecontroller.text = data.phone;
      _batchcontroller.text = data.batch;

      notifyListeners();
    });
  }

  TextEditingController get namecontroller => _namecontroller;

  TextEditingController get phonecontroller => _phonecontroller;

  TextEditingController get batchcontroller => _batchcontroller;

  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _batchcontroller = TextEditingController();
  String? get image => _image;
  String? _image;

  int get id => _id;
  int _id = 0;
  StudentModel? student;
  EditController({this.student});
}
