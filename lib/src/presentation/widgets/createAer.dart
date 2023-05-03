// ignore_for_file: file_names

import 'package:aer_v2/src/application/services/trash.dart';
import 'package:aer_v2/src/presentation/controllers/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/trash.dart';

class CreateAer extends StatefulWidget {
  const CreateAer({super.key});

  @override
  State<CreateAer> createState() => _CreateAerState();
}

class _CreateAerState extends State<CreateAer> {
  final TextEditingController _description = TextEditingController();
  var db = FirebaseFirestore.instance;
  XFile? _pickedFile;
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
          const SizedBox(
            height: 15,
          ),
          Text(_pickedFile?.name.toString() ?? ""),
          const SizedBox(
            height: 15,
          ),
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
                    onPressed: () => _uploadImage(),
                    child: const Text(
                      "Get Image",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ))
              ],
            ),
          )
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
                  onPressed: _pickedFile == null && _description.text.isEmpty
                      ? null
                      : () {
                          TrashService(context: context).insert(Trash(
                                  image: _pickedFile,
                                  description: _description.text,
                                  disposer: FirebaseAuth
                                      .instance.currentUser!.uid
                                      .toString())
                              .toFireStore());
                          Navigator.of(context).pop();
                        },
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Future<void> _uploadImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }
}
