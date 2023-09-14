import 'package:flutter/material.dart';

import '../domain/user.dart';

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
  elevation: 5,
  centerTitle: true,
);

textStyleButton() => const TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);

textStyleSimpleText() => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

displayUser(User user) {
  return Column(
    children: [
      const SizedBox(height: 40,),
      ListTile(
        leading: CircleAvatar(child: Text("${user.id}", style: textStyleSimpleText(),)),
        title: Text("Name: ${user.name!}", style: textStyleSimpleText(),),
        subtitle: Text("Age: ${user.age}", style: textStyleSimpleText()),
        trailing: Text("Sex: ${user.sexe}", style: textStyleSimpleText()),
      )
    ],
  );
}