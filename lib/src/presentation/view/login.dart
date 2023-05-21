import 'package:aer_v2/src/application/services/authentication.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late final Authentication authentication;

  bool _isHidden = true;
  bool showMessageError = false;

  @override
  void initState() {
    authentication = Authentication(context: context);
    super.initState();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: MediaQuery.of(context).size.height * 0.1),
          children: <Widget>[
            const Text(
              "ABS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Login in to your Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              controller: _email,
              decoration: const InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
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
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _password,
              onChanged: (value) {},
              validator: (value) {
                if ((value == null || value.isEmpty)) {
                  return 'please enter a password';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden
                          ? Icons.visibility
                          : Icons.visibility_off_outlined,
                      color: Colors.black54,
                    ),
                  )),
              obscureText: _isHidden,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () => Navigator.pushNamed(context, "/signup"),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
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
                  onPressed: (_email.text.isNotEmpty &&
                          _password.text.isNotEmpty &&
                          RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                              .hasMatch(_email.text.toString()))
                      ? () async {
                          authentication.login(_email.text.toString().trim(),
                              _password.text.toString().trim());
                        }
                      : null,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
