import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _themeMode = false;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
         const Padding(padding: EdgeInsets.only(left: 18, bottom: 24), child: Text("Settings", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "Account",
                  style: TextStyle(fontSize: 20,),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
                  maxRadius: 30,
                ),
                title: Text(
                  "${user?.email}",
                ),
                subtitle: const Text("Profile info"),
                trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => Navigator.pushNamed(context, "/account"),),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 20,),
                ),
              ),
              ListTile(
                leading:const Icon(Icons.language_outlined)
                ,
                title: const Text(
                  "Language",
                ),
                subtitle: const Text("English", style: TextStyle(
                  color: Colors.grey
                )),
                trailing: ConstrainedBox(
                  constraints:
                  const BoxConstraints.tightFor(height: 70, width: 45),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(14)))),
                      onPressed: () =>
                          Navigator.pushNamed(context, "/settings"),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )),
                ),
              ),
              const Divider(),
              ListTile(
                leading:  const Icon(Icons.notifications),
                title: const Text(
                  "Notifications",
                ),
                trailing: ConstrainedBox(
                  constraints:
                  const BoxConstraints.tightFor(height: 70, width: 45),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(14)))),
                      onPressed: () =>
                          print("hi"),
                      child: const Center(child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ))),
                ),
              ),
              const Divider(),
              ListTile(
                leading:  Icon(_themeMode ?Icons.dark_mode_sharp  : Icons.light_mode),
                title: const Text(
                  "Dark mode",
                ),
                subtitle: Text(_themeMode?"on":"off", style: const TextStyle(
                    color: Colors.grey
                )),
                trailing: Switch( value: _themeMode,
                  onChanged: (bool newValue) {
                    setState(() {
                      _themeMode = newValue;
                    });
                  },),
              ),
              const Divider(),
              ListTile(
                leading:  const Icon(Icons.help),
                title: const Text(
                  "Help",
                ),
                trailing: ConstrainedBox(
                  constraints:
                  const BoxConstraints.tightFor(height: 70, width: 45),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(14)))),
                      onPressed: () =>
                          print("hi"),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      )),
    );
  }
}
