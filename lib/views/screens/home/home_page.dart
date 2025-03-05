import 'package:flutter/material.dart';
import 'package:home/custom_appbar.dart';
import 'package:home/event_menu.dart';
import 'package:home/navigation_drawer.dart';
import 'package:home/utils/constants/colors.dart'; // Assuming you have your color constants

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? TColors.grey : TColors.lightGrey, // Dynamic background color
      appBar: CustomAppbar(
        title: "Home",
        isDarkMode: isDarkMode, // Pass the isDarkMode value to CustomAppbar
      ),
      drawer: isMobile ? NavDrawer() : null, // Conditionally show the drawer
      body: Row(
        children: [
          if (!isMobile) // Show NavDrawer on the side for larger screens
            NavDrawer(),
          Expanded(
            child: EventMenu(),
          ),
        ],
      ),
    );
  }
}