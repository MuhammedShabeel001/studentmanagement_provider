import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/functions/controller/student_controller.dart';
import 'package:student_management_provider/widget/student_detailes.dart';

class Search extends SearchDelegate {
  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<StudentModelController>(
      builder: (context, controller, child) {
        List filtered1 = controller.students;
        final filtered = filtered1
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

        if (query.isEmpty) {
          return const Center(
              child: Text('Seach'));
        } else if (filtered.isEmpty) {
          return const Center(
            child: Text('Not Found'),
          );
        }
        if (controller.students.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = filtered[index];
              String nameval = data.name;
              if ((nameval).contains(query)) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return Details(studentdetails: data);
                        }));
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: filtered.length,
          );
        } else {
          return const Center(
            child: Text(
              'No data',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    return Consumer<StudentModelController>(
      builder: (context, controller, child) {
        List filtered1 = controller.students;
        final filtered = filtered1
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        if (query.isEmpty) {
          return const Center(
              child: Text('Search'));
        } else if (filtered.isEmpty) {
          return const Center(
            child: Text('Not Found'),
          );
        }
        if (controller.students.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = filtered[index];
              String nameval = data.name;
              if ((nameval).contains((query.trim()))) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return Details(studentdetails: data);
                        }));
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              } else {}
              return null;
            },
            itemCount: filtered.length,
          );
        } else {
          return const Center(
            child: Text(
              'No data',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
