import 'package:flutter/material.dart';
import 'custom_event_card.dart';
import 'service_menu.dart'; // Import the ServiceMenu page

class ServicesHome extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  const ServicesHome({required this.menuItems, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color for content
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  (menuItems.length / 2).ceil(), // Group items into pairs
              itemBuilder: (context, index) {
                return Container(
                  width: 130, // Adjust width for better spacing
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // Disable nested scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1, // Maintain aspect ratio
                          ),
                          itemCount: 2, // 2 items per column
                          itemBuilder: (context, subIndex) {
                            int actualIndex = index * 2 + subIndex;
                            if (actualIndex >= menuItems.length) {
                              return SizedBox.shrink();
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceMenu(
                                      menuItems: menuItems[actualIndex],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: EventCard(
                                  imageUrl: menuItems[actualIndex]["image"]!,
                                  title: menuItems[actualIndex]["title"]!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
