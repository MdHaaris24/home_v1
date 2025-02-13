import 'package:flutter/material.dart';
import 'package:home/custom_appbar.dart';

class ServiceMenu1 extends StatefulWidget {
  final Map<String, String> menuItems;

  const ServiceMenu1({required this.menuItems, super.key});

  @override
  _ServiceMenu1State createState() => _ServiceMenu1State();
}

class _ServiceMenu1State extends State<ServiceMenu1> {
  int _selectedIndex = 0;

  final List<Map<String, String>> services = [
    {
      "image": "assets/images/cat_offer.png",
      "title": "Service 1",
      "details": "Details of Service 1"
    },
    {
      "image": "assets/images/cat_offer.png",
      "title": "Service 2",
      "details": "Details of Service 2"
    },
    {
      "image": "assets/images/cat_offer.png",
      "title": "Service 3",
      "details": "Details of Service 3"
    },
    {
      "image": "assets/images/cat_offer.png",
      "title": "Service 4",
      "details": "Details of Service 4"
    },
    {
      "image": "assets/images/cat_offer.png",
      "title": "Service 5",
      "details": "Details of Service 5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Service 1"),
      body: Row(
        children: [
          // Left side menu with images on top and text below
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: Colors.grey.shade300, width: 2)),
              ),
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Colors.blue.shade50
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              services[index]["image"]!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10), // Space between image and text
                          Text(
                            services[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Right side with image and details
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      services[_selectedIndex]["image"]!,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    services[_selectedIndex]["title"]!,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    services[_selectedIndex]["details"]!,
                    style: TextStyle(fontSize: 18),
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
