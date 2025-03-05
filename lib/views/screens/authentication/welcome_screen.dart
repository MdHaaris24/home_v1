import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/signin_screen.dart';
import 'package:home/signup_screen.dart';
import 'package:home/custom_scaffold.dart';
import 'package:home/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    double paddingHorizontal = isMobile ? 25.0 : (isTablet ? 50.0 : 70.0);
    double titleFontSize = isMobile ? 30.0 : (isTablet ? 35.0 : 38.0);

    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome Back!\n',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '\nEnter personal details to your employee account',
                        style: TextStyle(
                          fontSize: 20,
                          color: isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: () => Get.to(() => SignInScreen()),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: () => Get.to(() => SignUpScreen()),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}