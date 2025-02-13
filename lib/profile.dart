import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Name'),
              subtitle: Text('John Doe'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit name
                },
              ),
            ),
            ListTile(
              title: Text('Address'),
              subtitle: Text('123 Main St, Springfield, USA'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit address
                },
              ),
            ),
            ListTile(
              title: Text('Phone Number'),
              subtitle: Text('+1 234 567 890'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit phone number
                },
              ),
            ),
            ListTile(
              title: Text('Email Address'),
              subtitle: Text('john.doe@example.com'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit email address
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Booking History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Replace with actual booking history count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Booking ${index + 1}'),
                  subtitle: Text('Details of booking ${index + 1}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
