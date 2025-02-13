import 'package:flutter/material.dart';
import 'package:home/custom_appbar.dart';
import 'package:home/event_menu.dart';
import 'package:home/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home"),
      drawer: NavDrawer(),
      body: EventMenu(),
    );
  }
}
