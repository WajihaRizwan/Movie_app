import 'package:flutter/material.dart';
import 'package:movieapp/widgets/edit_profile.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B3A), // Dark background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1B3A),
        elevation: 0,
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile header
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'asessts/644d4e1063c37f8a07062777521d762f.jpg'), // Replace with user's image URL
                ),
                SizedBox(height: 8),
                Text(
                  "Wajiha Lakhany",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "@wajihalakhany",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          // Menu options
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  icon: Icons.person,
                  text: "My Profile",
                  onTap: () {
                   Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>   EditProfile(),
      ),
    );
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.notifications,
                  text: "Notification",
                  onTap: () {
                    // Navigate to Notifications page
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.history,
                  text: "History",
                  onTap: () {
                    // Navigate to History page
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.subscriptions,
                  text: "My Subscription",
                  onTap: () {
                    // Navigate to Subscription page
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.settings,
                  text: "Setting",
                  onTap: () {
                    // Navigate to Settings page
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  text: "Logout",
                  onTap: () {
                    // Perform Logout action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C1B3A),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.download), label: "Downloads"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({super.key, 
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }
}
