// ignore_for_file: use_build_context_synchronously

import 'package:aer_v2/src/presentation/widgets/snackbarNotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication with SnackbarNotification {
  final BuildContext context;
  Authentication({required this.context});
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        normalNotification(
            "user ${value.user!.email!.toString()} created successfully",
            context);
      }).whenComplete(() => Navigator.pushNamed(context, "/"));
    } on FirebaseAuthException catch (e) {
      normalNotification(e.message.toString(), context);
    } catch (e) {
      normalNotification(e.toString(), context);
    }
  }

  Future<void> login(email, password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('wrong password provided for that user');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser() async {
    try {
      await auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    } catch (e) {}
  }
}
