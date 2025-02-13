import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to Home
            },
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Services'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to Services
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Packages'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to Packages
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to Contact Us
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation to About Us
            },
          ),
        ],
      ),
    );
  }
}
