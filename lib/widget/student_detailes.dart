import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_management_provider/model/student_model.dart';
import 'package:student_management_provider/widget/appbar.dart';

class Details extends StatelessWidget {
  final StudentModel studentdetails;
  const Details({super.key, required this.studentdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, 'Details'),
      body: SafeArea(
        child: Container(
          color: Colors.purple.shade100,
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(File(studentdetails.image)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Name :${studentdetails.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Phone no :${studentdetails.phone}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Batch :${studentdetails.batch}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
