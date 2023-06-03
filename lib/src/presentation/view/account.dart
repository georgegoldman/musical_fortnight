import 'dart:io';

import 'package:aer_v2/src/util/getImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/account/update_btn.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with GetImageFromDevice {
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final double _navBorderRadius = 50;
  final Color _navButtonColor = Colors.grey;
  final user = FirebaseAuth.instance.currentUser;
  XFile? _pickedFile;

  bool _isHidden = true;

  @override
  void initState() {
    _email.text = user?.email ?? '';
    _displayName.text = user?.displayName ?? '';
    _phoneNumber.text = user?.phoneNumber ?? '';

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
              _pickedFile == null? const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/15031661/pexels-photo-15031661.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load"),
                maxRadius: 90,
              ): CircleAvatar(
                backgroundImage: FileImage(File(_pickedFile!.path)),
                maxRadius: 90,
              ),
              Positioned(
                right: 1,
                  bottom: 0,
                  child: IconButton(onPressed: ()=> showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),
                      context: context, builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 24, right: 15, bottom: 15),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Profile photo", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32
                                    ),),
                                    IconButton(onPressed: ()=> print("hi"),
                                        icon: const Icon(Icons.restore_from_trash, size: 30,)
                                    ),
                                  ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: () async{
                                            XFile? imgeFromCamera = await getImageUsingCamera();
                                            setState(() {
                                              _pickedFile = imgeFromCamera;
                                            });
                                            Navigator.pop(context);
                                          },
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    side: const BorderSide(color: Colors.black)
                                                ))
                                              ),
                                              icon: const Icon(Icons.camera_alt_rounded, size: 30,)
                                          ),
                                          const Text("Camera")
                                        ],
                                      ),
                                      const SizedBox(width: 50,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: () async{
                                            XFile? imgeFromCamera = await getImageUsingGallery();
                                            setState(() {
                                              _pickedFile = imgeFromCamera;
                                            });
                                            Navigator.pop(context);
                                          },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50),
                                                      side: const BorderSide(color: Colors.black)
                                                  ))
                                              ),
                                              icon: const Icon(Icons.photo, size: 30,)
                                          ),
                                          const Text("Gallery")
                                        ],
                                      ),
                                    ]
                                )
                              ],
                            ),
                          ),
                        );
                  }
                  ),
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

              decoration:  const InputDecoration(
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
            const SizedBox(height: 24,),
            TextFormField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              controller: _phoneNumber,
              decoration: const InputDecoration(
                label: Text("Phone"),
                suffixIcon: Icon(
                  Icons.phone,
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
          ],
        ),
      ),
    );
  }
}
