import 'package:flutter/material.dart';
import 'custom_event_card.dart';
import 'service_menu.dart';
import 'package:home/utils/constants/colors.dart';

class ServicesHome extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  const ServicesHome({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    double titleFontSize = isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
    double sectionSpacing = isMobile ? 10.0 : 20.0;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? TColors.black : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, -5),
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 5), // Bottom shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Services",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? TColors.white : TColors.dark,
                  ),
                  textAlign: TextAlign.start,
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to view all services
                    // Implement your navigation logic here
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.blue, // Or your theme's accent color
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sectionSpacing / 2),
          SizedBox(
            height: isMobile ? 300 : 190,
            child: isMobile
                ? GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return _buildMenuItem(context, index, isMobile);
              },
            )
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: menuItems.map((item) {
                  return _buildMenuItem(context, menuItems.indexOf(item), false);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, int index, bool isMobile) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceMenu(menuItems: menuItems[index]),
          ),
        );
      },
      child: Container(
        width: isMobile ? 100 : 120,
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                menuItems[index]["image"]!,
                width: isMobile ? 90 : 100,
                height: isMobile ? 90 : 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6),
            SizedBox(
              width: 100,
              child: Text(
                menuItems[index]["title"]!,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}