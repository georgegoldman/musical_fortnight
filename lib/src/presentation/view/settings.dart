import 'package:aer_v2/src/presentation/widgets/settings/settings_nav_btn.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
                trailing: const SettingsNavBtn(destination: "account",),
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
              const ListTile(
                leading:Icon(Icons.language_outlined)
                ,
                title: Text(
                  "Language",
                ),
                subtitle: Text("English", style: TextStyle(
                  color: Colors.grey
                )),
                trailing: SettingsNavBtn(destination: null,),
              ),
              const Divider(),
              const ListTile(
                leading:  Icon(Icons.notifications),
                title: Text(
                  "Notifications",
                ),
                trailing: SettingsNavBtn(destination: null,),
              ),
              const Divider(),
              ListTile(
                leading:  Icon(_themeMode ?Icons.dark_mode_sharp  : Icons.light_mode),
                title: const Text(
                  "Dark mode",
                ),
                subtitle: Text(_themeMode?"on":"off", style: const TextStyle(
                    color: Colors.grey,
                )),
                trailing: Switch( value: _themeMode,
                  activeColor: Colors.grey,
                  inactiveTrackColor: Colors.white54,
                  onChanged: (bool newValue) {
                    setState(() {
                      _themeMode = newValue;
                    });
                  },),
              ),
              const Divider(),
              const ListTile(
                leading:  Icon(Icons.help),
                title: Text(
                  "Help",
                ),
                trailing: SettingsNavBtn(destination: null,),
              ),
              const Divider(),
            ],
          )
        ],
      )),
    );
  }
}
