import 'package:flutter/material.dart';
import 'package:home/theme.dart';
import 'package:home/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: WelcomeScreen(),
    ),
  );
}
