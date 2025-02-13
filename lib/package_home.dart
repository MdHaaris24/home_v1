import 'package:flutter/material.dart';
import 'package:home/package_menu.dart';

class PackageHome extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  const PackageHome({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Set a fixed height for the ListView
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(
                    menuItems[index]["image"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuItems[index]["title"]!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
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
    );
  }
}
