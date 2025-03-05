import 'package:flutter/material.dart';
import 'package:home/custom_appbar.dart';
import 'package:home/navigation_drawer.dart';
import 'package:home/utils/constants/colors.dart'; // Assuming you have your color constants

class PackageMenu extends StatelessWidget {
  final Map<String, String> menuItems;

  const PackageMenu({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? TColors.black : TColors.white, // Dynamic background color
      appBar: CustomAppbar(
        title: menuItems["title"]!,
        isDarkMode: isDarkMode, // Pass the isDarkMode value to CustomAppbar
      ),
      drawer: isMobile ? NavDrawer() : null, // Conditionally show the drawer
      body: Row(
        children: [
          if (!isMobile) // Show NavDrawer on the side for larger screens
            NavDrawer(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(isMobile ? 5 : 10), // Adjust margin
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 5 : 10), // Adjust padding
                    child: Row(
                      children: [
                        Image.asset(
                          menuItems["image"]!,
                          width: isMobile ? 80 : 100, // Adjust image size
                          height: isMobile ? 80 : 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: isMobile ? 5 : 10), // Adjust spacing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menuItems["title"]!,
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18, // Adjust font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: isMobile ? 5 : 10), // Adjust spacing
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Learn More"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}