import 'package:flutter/material.dart';

class CreateAer extends StatefulWidget {
  const CreateAer({super.key});

  @override
  State<CreateAer> createState() => _CreateAerState();
}

class _CreateAerState extends State<CreateAer> {
  TextEditingController _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CreateAer"),
      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          TextField(
            controller: _description,
            keyboardType: TextInputType.multiline,
          ),
        ],
      )),
    );
  }
}
