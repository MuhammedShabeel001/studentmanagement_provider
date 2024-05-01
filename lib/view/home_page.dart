import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/student_controller.dart';
import 'package:student_management_provider/model/student_model.dart';
import 'package:student_management_provider/view/add_student.dart';
import 'package:student_management_provider/view/search_student.dart';
import 'package:student_management_provider/widget/student_tile.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple.shade300,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
          title: const Text(
            'Students',
            style:  TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudent(),));
            // Get.toNamed('/addStudent');
          },
          backgroundColor: Colors.purple.shade300,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child:Consumer<StudentModelController>(builder: (context, value, child) {
            final values = value.students;
            List<StudentModel> reversedList = values.reversed.toList();
            log('$values');
            return StudentListView(reversedList: reversedList, controller: value);
          },)
    
        ));
  }
}
