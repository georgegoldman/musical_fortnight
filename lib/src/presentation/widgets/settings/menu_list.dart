import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMenuList extends StatelessWidget {
  final String title;
  const SettingsMenuList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
        maxRadius: 30,
      ),
      title: Text(
        "$title",
      ),
      subtitle: const Text("Profile info"),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () => Navigator.pushNamed(context, "/account"),),
    );
  }
}
