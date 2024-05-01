import 'package:flutter/material.dart';

snackbar(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 232, 107, 99),
    margin: const EdgeInsets.all(50),
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black),
    ),
  ));
}