import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/custom_scaffold.dart';
import 'package:home/home_page.dart';
import 'package:home/signup_screen.dart';
import 'package:home/utils/constants/sizes.dart';
import 'package:home/utils/constants/colors.dart';
import 'controller/auth_controller.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    double containerPaddingHorizontal = isMobile ? 25.0 : (isTablet ? 50.0 : 70.0);
    double containerPaddingTop = isMobile ? 50.0 : (isTablet ? 70.0 : 70.0);
    double spacingBetweenFields = isMobile ? TSizes.spaceBtwInputFields : (isTablet ? 20.0 : 25.0);
    double titleFontSize = isMobile ? 30.0 : (isTablet ? 35.0 : 38.0);
    double buttonWidth = isMobile ? double.infinity : 300;
    BorderRadius containerBorderRadius = BorderRadius.circular(40.0);

    return CustomScaffold(
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 500),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                containerPaddingHorizontal,
                containerPaddingTop,
                containerPaddingHorizontal,
                containerPaddingHorizontal,
              ),
              decoration: BoxDecoration(
                color: isDarkMode ? TColors.black : TColors.white,
                borderRadius: containerBorderRadius,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sign In',
                      style: theme.textTheme.headlineMedium?.copyWith(fontSize: titleFontSize),
                    ),
                    SizedBox(height: spacingBetweenFields * 2),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white12 : Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Please enter email' : null,
                    ),
                    SizedBox(height: spacingBetweenFields),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white12 : Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Please enter password' : null,
                    ),
                    SizedBox(height: spacingBetweenFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberPassword,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberPassword = value!;
                                });
                              },
                              activeColor: TColors.primary,
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white54 : Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // Implement forgot password functionality here
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: TColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacingBetweenFields),
                    SizedBox(
                      width: buttonWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthController.instance.login(
                                emailController.text, passwordController.text);
                            Get.offAll(() => HomePage());
                          }
                        },
                        child: const Text('Sign In'),
                      ),
                    ),
                    SizedBox(height: spacingBetweenFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: isDarkMode ? Colors.white54 : Colors.black45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => SignUpScreen()),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}