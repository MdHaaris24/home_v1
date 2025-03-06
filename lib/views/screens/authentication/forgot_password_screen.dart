import 'package:flutter/material.dart';
import 'package:home/utils/constants/colors.dart'; // Assuming you have your color constants

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? TColors.black : TColors.white, // Dynamic background color
      appBar: AppBar(
        backgroundColor: isDarkMode ? TColors.black : TColors.white, // Dynamic app bar color
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: isDarkMode ? TColors.white : TColors.dark, // Dynamic text color
          ),
        ),
        iconTheme: IconThemeData(
          color: isDarkMode ? TColors.white : TColors.dark, // Dynamic icon color
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 32.0), // Adjust padding
          child: Text(
            'Forget Password',
            style: TextStyle(
              fontSize: isMobile ? 24.0 : 32.0, // Adjust font size
              color: isDarkMode ? TColors.white : TColors.dark, // Dynamic text color
            ),
          ),
        ),
      ),
    );
  }
}