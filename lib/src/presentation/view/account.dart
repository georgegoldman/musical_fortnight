import 'package:flutter/material.dart';

import '../widgets/account/update_btn.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final double _navBorderRadius = 50;
  final Color _navButtonColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          UpdateButton(),
          SizedBox(width: 24,)
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          children: [
            const SizedBox(height: 24,),
             Center(child: Stack(children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
                maxRadius: 90,
              ),
              Positioned(
                right: 1,
                  bottom: 0,
                  child: IconButton(onPressed: ()=> print("hi"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(_navButtonColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_navBorderRadius)
                    ))
                  ),
                  icon: const Icon(Icons.camera_alt, size: 40,),))
            ],),),
            const SizedBox(height: 24,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: _email,
              decoration: const InputDecoration(
                label: Text("Email"),
                suffixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
              validator: (value) {
                if ((_email.text != '' || _email.text.isNotEmpty) &&
                    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(_email.text)) {
                  return 'please fill in the field';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 24,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: _displayName,
              decoration: const InputDecoration(
                label: Text("username"),
                suffixIcon: Icon(
                  Icons.person,
                ),
              ),
              validator: (value) {
                if ((_email.text != '' || _email.text.isNotEmpty)
                        ) {
                  return 'please fill in the field';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
