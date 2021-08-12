import 'package:contacts_book/screens/home/home.dart';
import 'package:contacts_book/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: appTheme,
    )
  );
}