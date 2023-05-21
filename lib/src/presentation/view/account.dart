import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(padding: const EdgeInsets.only(right: 10), child: ConstrainedBox(
            constraints:
            const BoxConstraints.tightFor(height: 45, width: 45),
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
                  Icons.check,
                  size: 15,
                )),
          ),)
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
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
