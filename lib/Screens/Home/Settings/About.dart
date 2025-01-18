import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About NexusApp'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  // App Logo
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/App Data/letter-n.png'),
                  ),
                  SizedBox(height: 16),
                  // App Name
                  Text(
                    'NexusApp',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // App Tagline
                  Text(
                    'Your seamless chat solution',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // App Description
            Text(
              'About the App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'NexusApp is a chat application designed to provide seamless communication '
                  'with a modern interface and enhanced features. Stay connected with your '
                  'friends, family, and colleagues effortlessly.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Developer Info
            Text(
              'Developer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Developed by Aryan Bhimani, a skilled Flutter and Android developer with '
                  'over 2 years of experience in building mobile applications. Visit my portfolio '
                  'for more projects: https://dev-aryanbhimani.pantheonsite.io/',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Version Info
            Text(
              'Version',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'NexusApp v1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            // Footer
            Center(
              child: Text(
                '© 2025 AMB Techno Consultant',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
