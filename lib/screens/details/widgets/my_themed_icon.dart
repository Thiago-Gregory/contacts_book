import 'package:contacts_book/style.dart';
import 'package:flutter/material.dart';

class MyThemedIcon extends StatelessWidget {
  IconData icon;

  MyThemedIcon({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      this.icon,
      color: blueTheme,
    );
  }
}
