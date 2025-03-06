import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/views/screens/home/package_home.dart';
import 'package:home/views/screens/home/service_home.dart';
import 'views/screens/home/offer_slide.dart';
import 'package:home/utils/constants/colors.dart';
import 'package:home/utils/constants/sizes.dart';

class EventMenu extends StatelessWidget {
  final List<String> offerImages = [
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
  ];

  EventMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    double titleFontSize = isMobile ? 24.0 : (isTablet ? 28.0 : 32.0);
    double sectionSpacing = isMobile ? 10.0 : 20.0;

    return Scaffold(
      backgroundColor: isDarkMode ? TColors.black : TColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            OfferSlide(offerImages: offerImages),
            SizedBox(height: sectionSpacing * 2),
            const ServicesHome(), // Use the updated ServicesHome
            SizedBox(height: sectionSpacing),
            Text(
              "Our Packages",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? TColors.white : TColors.dark,
              ),
            ),
            SizedBox(height: sectionSpacing),
            SizedBox(height: sectionSpacing),
          ],
        ),
      ),
    );
  }
}