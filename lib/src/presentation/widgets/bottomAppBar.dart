import 'package:aer_v2/src/application/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavAppBar extends StatelessWidget {
  const NavAppBar(
      {super.key, required this.isVisible, required this.isElevated});

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: 80,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
                                ),
                                title: Text(
                                  "Hi ${FirebaseAuth.instance.currentUser!.email}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                trailing:
                                    const Icon(Icons.view_comfortable_rounded),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "500g",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text("Saved CO2")
                                    ],
                                  )),
                                  const VerticalDivider(
                                    width: 20,
                                    thickness: 1,
                                    indent: 20,
                                    endIndent: 0,
                                    color: Colors.grey,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: const [
                                      Text(
                                        "343",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        "point",
                                      )
                                    ],
                                  ))
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                      backgroundColor: Colors.white,
                                      minimumSize: const Size.fromHeight(50)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Authentication(context: context).signout();
                                  },
                                  child: const Text("Sign Out"))
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
