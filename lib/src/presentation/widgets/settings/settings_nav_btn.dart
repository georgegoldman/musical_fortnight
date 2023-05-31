import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsNavBtn extends StatelessWidget {
  final String? destination;
  final double _navBorderRadius = 11.0;
  final Color _navButtonColor = Colors.grey;
  const SettingsNavBtn({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(_navButtonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_navBorderRadius)
        ))
      ),
      icon: const Icon(Icons.arrow_forward),
      onPressed: destination == null ? null : () => Navigator.pushNamed(context, "/$destination"),);
  }
}
