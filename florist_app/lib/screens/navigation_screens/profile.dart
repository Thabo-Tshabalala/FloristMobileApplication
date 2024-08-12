import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString('userEmail');
    });
  }

  Future<void> deleteUserByEmail(String email) async {
    final Uri url = Uri.parse('http://10.0.2.2:8080/user/deleteByEmail?email=$email');
  
    try {
      print('Attempting to delete user with email: $email');
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print('User deleted successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User deleted successfully'))
        );
        // Optionally, navigate away or reset state
        // For example, log the user out or navigate to a login screen
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete user. Status code: ${response.statusCode}'))
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred: $e'))
      );
    }
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                if (_userEmail != null) {
                  await deleteUserByEmail(_userEmail!);
                  // Optionally, handle any post-deletion actions here
                } else {
                  // Handle the case where email is not found
                  print('User email not found');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User email not found'))
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color for the whole screen
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Thabo', // Replace with actual user name
                    // style: Theme.of(context).textTheme.headline6?.copyWith(
                    //       color: Colors.black, // Text color for the user name
                    //     ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _userEmail ?? 'Loading......', // Show user email or loading text
                    // style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    //       color: Colors.grey[600], // Text color for the user email
                    //     ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Profile Options
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: Colors.green),
                    title: const Text('FAQ'),
                    onTap: () {
                      // Navigate to FAQ screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline, color: Colors.green),
                    title: const Text('About Us'),
                    onTap: () {
                      // Navigate to About Us screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.description, color: Colors.green),
                    title: const Text('Terms & Conditions'),
                    onTap: () {
                      // Navigate to Terms & Conditions screen
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.green),
                    title: const Text('Logout'),
                    onTap: () {
                      // Implement logout functionality
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete_forever, color: Colors.red),
                    title: const Text('Delete Account'),
                    onTap: () {
                      _showDeleteConfirmationDialog(context);
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
}
