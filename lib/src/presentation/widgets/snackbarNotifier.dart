import 'package:flutter/material.dart';

mixin SnackbarNotification {
  void normalNotification(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }
}
