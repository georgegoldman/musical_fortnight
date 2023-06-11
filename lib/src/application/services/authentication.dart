// ignore_for_file: use_build_context_synchronously

import 'package:aer_v2/src/presentation/widgets/snackbarNotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class Authentication with SnackbarNotification, ChangeNotifier {
  final BuildContext context;
  Authentication({required this.context});
  FirebaseAuth auth = FirebaseAuth.instance;

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<void> signup(email, password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      normalNotification(e.message.toString(), context);
    } catch (e) {
      normalNotification(e.toString(), context);
    }
  }

  Future<void> login(email, password) async {
    try {
      _loggedInStatus = Status.Authenticating;
      notifyListeners();
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("an error occured");
      normalNotification(e.message.toString(), context);
    } catch (e) {
      normalNotification(e.toString(), context);
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

  Future<void> update(displayName, newEmail, phoneCredential, photoURL) async {
    try {
      await auth.currentUser?.updateDisplayName(displayName);
      await auth.currentUser?.updateEmail(newEmail);
      await auth.currentUser?.updatePhoneNumber(phoneCredential);
      await auth.currentUser?.updatePhotoURL(photoURL);
    } catch (e){
    }
  }
}
