import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const EventCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16), // Makes the image rounded rectangle
          child: Image.network(
            imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8), // Space between image and text
        Text(
          title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}