
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../application/services/authentication.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('trash').snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: IconButton(
            icon: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
            ),
            onPressed: () => Navigator.pushNamed(context, "/settings"),
          ),
        ),
        title: Row(
          children: [
            const Text(
              "hi, ",
              style: TextStyle(fontSize: 24,
                  color: Colors.grey
              ),
            ),
            Text(
              "${user?.email}",
              style: const TextStyle(
                  fontSize: 24,
                  ),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                bottompop_up();
              },
              icon: const Icon(
                Icons.delete_sweep_outlined,
                size: 32,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        ListTile(
                          title: Text(data['description']),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(data['image']),
                            maxRadius: 20,
                          ),
                          onTap: () => print("object"),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aer');
        },
        tooltip: 'Add new treat',
        elevation: 3,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<dynamic> bottompop_up() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: <Widget>[

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
  }
}
