import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                    db.collection("users").add(user).then(
                        (DocumentReference doc) =>
                            print('DocumentSnapshot added with ID: ${doc.id}'));
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
