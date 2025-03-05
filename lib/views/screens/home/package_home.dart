import 'package:flutter/material.dart';
import 'package:home/package_menu.dart';
import 'package:home/utils/constants/colors.dart'; // Assuming you have your color constants

class PackageHome extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  const PackageHome({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return SizedBox(
      height: isMobile ? 400 : 300, // Adjust height based on screen size
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(isMobile ? 10 : 10), // Adjust margin
            color: isDarkMode ? TColors.darkerGrey : Colors.white, // Dynamic card color
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 10 : 10), // Adjust padding
              child: Row(
                children: [
                  Image.asset(
                    menuItems[index]["image"]!,
                    width: isMobile ? 100 : 100, // Adjust image size
                    height: isMobile ? 100 : 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: isMobile ? 10 : 10), // Adjust spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuItems[index]["title"]!,
                          style: TextStyle(
                            fontSize: isMobile ? 20 : 18, // Adjust font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isMobile ? 5 : 10), // Adjust spacing
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PackageMenu(
                                  menuItems: menuItems[index],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 16 : 24,
                                vertical: isMobile ? 8 : 12), // Adjust padding
                            minimumSize:
                            Size(isMobile ? 120 : 150, isMobile ? 40 : 50), // Adjust size
                            backgroundColor:
                            isDarkMode ? TColors.darkerGrey : Colors.blue, // Dynamic button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                          ),
                          child: Text(
                            "Learn More",
                            style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.bold), // Adjust text size
                          ),
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
    );
  }
}