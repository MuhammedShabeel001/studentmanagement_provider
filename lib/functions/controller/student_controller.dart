import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_management_provider/model/student_model.dart';

class StudentModelController extends ChangeNotifier{
  late Database _db;

  final List<StudentModel> _students = [];

  StudentModelController() {
    initializingdatabase();
    log('initializing success');
  }


  Future<void> initializingdatabase() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute('''CREATE TABLE student(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          batch TEXT,
          image TEXT
          )''');
    });
    getallstudent();
  }

  Future<void> addstudent1(StudentModel value) async {
    await _db.execute(
        'INSERT INTO student(name,phone,batch,image)VALUES(?,?,?,?)',
        [value.name, value.phone, value.batch, value.image]);

    getallstudent();
    notifyListeners();
  }

  List <StudentModel> get students => _students;

  Future<void> getallstudent() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    log('$values');
    _students.clear();
    for (var map in values) {
      final student = StudentModel.fromMap(map);
      _students.add(student);
    }
    notifyListeners();
  }



  Future<void> deletestudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getallstudent();
  }


  Future<void> updatestudent(int id, String name, String phone,
      String batch, String image) async {
    log('id===$id');
    final data = {
      'name': name,
      'phone': phone,
      'batch': batch,
      'image': image,
    };
    await _db.update('student', data, where: 'id=?', whereArgs: [id]);
    log('updated');
    getallstudent();
  }
}