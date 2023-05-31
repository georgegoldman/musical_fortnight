import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final double _navBorderRadius = 11.0;
  final Color _navButtonColor = Colors.grey;
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(_navButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_navBorderRadius)
          ))
      ),
      icon: const Icon(Icons.check),
      onPressed: () => print("Saving..."),);
  }
}
