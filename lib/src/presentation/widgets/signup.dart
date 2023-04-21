import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isHidden = true;
  bool showMessageError = false;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: MediaQuery.of(context).size.height * 0.03),
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
              "Create your Account",
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
                if ((value == null || value.isEmpty)) {
                  return 'please fill in the field';
                } else if (!(RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                    .hasMatch(value))) {
                  return 'please enter valid email';
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
                if (value == null || value.isEmpty) {
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
                  onPressed:
                      (_email.text.isNotEmpty && _password.text.isNotEmpty)
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(content: Text('Processing Data')));
                              }
                            }
                          : null,
                  child: const Text(
                    "Signup",
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
