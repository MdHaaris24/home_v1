import 'package:flutter/material.dart';
import 'package:home/cart.dart';
import 'package:home/profile.dart';
import 'package:home/custom_search.dart';
import 'package:home/utils/constants/colors.dart'; // Assuming you have your color constants

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode; // Add this parameter
  final List<String> searchData = [
    "Birthday",
    "Wedding",
    "Reception",
    "Engagement",
    "Baby Shower",
  ];

  CustomAppbar({
    super.key,
    required this.title,
    required this.isDarkMode, // Receive the isDarkMode value
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AppBar(
      backgroundColor: isDarkMode ? TColors.black : TColors.white, // Dynamic background color
      title: Text(
        title,
        style: TextStyle(
          color: isDarkMode ? TColors.white : TColors.dark, // Dynamic title color
        ),
      ),
      leading: isMobile
          ? Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: isDarkMode ? TColors.white : TColors.dark, // Dynamic icon color
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      )
          : null, // Hide the menu icon on larger screens
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: isDarkMode ? TColors.white : TColors.dark, // Dynamic icon color
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearch(data: searchData),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: isDarkMode ? TColors.white : TColors.dark, // Dynamic icon color
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.account_circle,
            color: isDarkMode ? TColors.white : TColors.dark, // Dynamic icon color
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}