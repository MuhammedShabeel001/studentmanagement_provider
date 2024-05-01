import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/edit_controller.dart';
import 'package:student_management_provider/functions/controller/image_controller.dart';
import 'package:student_management_provider/functions/controller/student_controller.dart';
import 'package:student_management_provider/view/home_page.dart';
// import 'package:studentmanagement_provider/functions/db_functions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var database = StudentModelController();
  database.initializingdatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => StudentModelController(),),
        ChangeNotifierProvider(create: (context) => EditController(),),
        ChangeNotifierProvider(create: (context) => Imagecontroller(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
