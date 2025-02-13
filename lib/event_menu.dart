import 'package:flutter/material.dart';
import 'package:home/package_home.dart';
import 'package:home/service_home.dart';
import 'offer_slide.dart';

class EventMenu extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {"image": "assets/images/cat_offer.png", "title": "Birthday"},
    {"image": "assets/images/cat_offer.png", "title": "Wedding"},
    {"image": "assets/images/cat_offer.png", "title": "Reception"},
    {"image": "assets/images/cat_offer.png", "title": "Engagement"},
    {"image": "assets/images/cat_offer.png", "title": "Baby Shower"},
    {"image": "assets/images/cat_offer.png", "title": "Reception"},
    {"image": "assets/images/cat_offer.png", "title": "Engagement"},
    {"image": "assets/images/cat_offer.png", "title": "Baby Shower"},
  ];

  final List<String> offerImages = [
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
    "assets/images/cat_offer.png",
  ];

  EventMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            OfferSlide(offerImages: offerImages),
            SizedBox(height: 10),
            Text(
              "Our Services",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ServicesHome(menuItems: menuItems),
            SizedBox(height: 10),
            Text(
              "Our Packages",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PackageHome(menuItems: menuItems),
          ],
        ),
      ),
    );
  }
}
