// ignore_for_file: file_names

import 'dart:io';

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
          _imageCard(),
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

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _image(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_pickedFile != null) {
      final path = _pickedFile!.path;

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
