import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String imageUrl;

  const OfferCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0), // Space between slides
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        child: Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.cover, // Ensures proper image scaling
        ),
      ),
    );
  }
}