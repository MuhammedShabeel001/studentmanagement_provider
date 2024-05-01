import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagecontroller extends ChangeNotifier {
  bool _istrue = false;
  File _image1 = File('');
  String _image = '';
  setbool(bool val) {
    _istrue = val;
  }

  bool get istrue => _istrue;
  File get image1 => _image1;
  String get image => _image;
  Future<void> fromgallery(context) async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img1 != null) {
      _image1 = File(img1.path);
      _image = _image1.path;
      notifyListeners();
      _istrue = true;
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> fromcamera(context) async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img1 != null) {
      _image1 = File(img1.path);
      _image = image1.path;
      notifyListeners();
      _istrue = true;
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
