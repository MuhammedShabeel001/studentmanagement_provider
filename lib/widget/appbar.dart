import 'package:flutter/material.dart';
// import 'package:get/get.dart';

AppBar myAppbar(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.purple.shade300,
    centerTitle: true,
    // leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
