import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700], // Blue app bar
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold ,fontSize: 24),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press here, e.g., Navigator.pop(context)
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile'), // You can customize the title
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align to the top
          children: <Widget>[
            const SizedBox(height: 20), // Add some spacing at the top

            // Profile Image
            GestureDetector( // Make the image tappable
              onTap: () {
                // Handle image tap, e.g., open image picker or view larger image
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
              
                    backgroundImage: const AssetImage('assets/profile.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // User Name & Title
            const Text(
              'Isuru Priyankara',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // List of Options (using ListView)
            Expanded( // Use Expanded to take up available space
              child: ListView(
                shrinkWrap: true, // Prevent unbounded height issues
                children: <Widget>[
                  _buildListTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    subtitle: 'Set up notification',
                    onTap: () {
                      // Handle notification tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.delete,
                    title: 'Trash',
                    subtitle: 'Check out trash',
                    onTap: () {
                      // Handle trash tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.settings,
                    title: 'Settings',
                    subtitle: 'Customize your settings',
                    onTap: () {
                      // Handle settings tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.question_mark,
                    title: 'FAQs',
                    subtitle: 'Have any questions?',
                    onTap: () {
                      // Handle FAQs tap
                    },
                  ),
                  _buildListTile(
                    icon: Icons.logout,
                    title: 'Log out',
                    subtitle: 'Want to leave?',
                    onTap: () {
                      // Handle logout tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build ListTile
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}