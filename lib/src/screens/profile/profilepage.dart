// screens/profile/profilepage.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile screen
              _navigateToEditProfile(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profile_pic.png'), // Add a profile picture asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe', // Example user name
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'john.doe@example.com', // Example user email
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Options
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text('My Orders'),
              onTap: () {
                // Navigate to orders screen
                _navigateToOrders(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings screen
                _navigateToSettings(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
                _handleLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to edit profile screen (placeholder)
  void _navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Edit Profile')),
          body: Center(
            child: Text('Edit Profile Screen (Placeholder)'),
          ),
        ),
      ),
    );
  }

  // Navigate to orders screen (placeholder)
  void _navigateToOrders(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('My Orders')),
          body: Center(
            child: Text('Orders Screen (Placeholder)'),
          ),
        ),
      ),
    );
  }

  // Navigate to settings screen (placeholder)
  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Settings')),
          body: Center(
            child: Text('Settings Screen (Placeholder)'),
          ),
        ),
      ),
    );
  }

  // Handle logout (placeholder)
  void _handleLogout(BuildContext context) {
    // Perform logout actions (e.g., clear user data, navigate to login screen)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out successfully')),
    );
    // Navigate to login screen
    Navigator.pushReplacementNamed(context, '/login');
  }
}
