import 'package:flutter/material.dart';

class NavAppBar extends StatelessWidget {
  const NavAppBar(
      {super.key, required this.isVisible, required this.isElevated});

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: 80,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  final SnackBar snackBar = SnackBar(
                    content: const Text("Yay! A SnackBar!"),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.more_vert)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              tooltip: 'Search',
            )
          ],
        ),
      ),
    );
  }
}
