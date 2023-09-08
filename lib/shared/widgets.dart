import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String content, required String label, Color color = Colors.pink}) => SnackBar(
  content: Text(content),
  backgroundColor: color,
  action: SnackBarAction(
    label: label,
    onPressed: () {
      Navigator.pop(context);
    },
  ),
);

customAppBar({required String title}) => AppBar(
  backgroundColor: Colors.purpleAccent,
  iconTheme: const IconThemeData(color: Colors.white),
  title: Text(title, style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white
  ),),
  centerTitle: true,
);

customTextStyleButton() => const TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);