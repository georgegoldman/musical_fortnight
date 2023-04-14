// ignore_for_file: file_names

import 'package:aer_v2/src/application/services/trash.dart';
import 'package:aer_v2/src/presentation/controllers/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/models/trash.dart';

class CreateAer extends StatefulWidget {
  const CreateAer({super.key});

  @override
  State<CreateAer> createState() => _CreateAerState();
}

class _CreateAerState extends State<CreateAer> {
  final TextEditingController _description = TextEditingController();
  var db = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "firstname": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CreateAer"),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          TextFormField(
            controller: _description,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please type into the text field';
              }
              return null;
            },
          ),
        ],
      )),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    TrashService().insert(
                        Trash(description: 'uploading dirt').toFireStore());
                  },
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.redAccent),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
