import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Introduction
            Text(
              'At NexusApp, we are committed to protecting your privacy. This Privacy Policy explains '
                  'how we collect, use, and safeguard your information when you use our application.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Data Collection
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Personal Information: We may collect personal details such as your name, email address, '
                  'and phone number when you create an account or contact us.\n'
                  '2. Usage Data: We may collect information about how you interact with the app, such as '
                  'features used, time spent, and errors encountered.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Data Usage
            Text(
              'How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use your information to provide, improve, and personalize your experience with NexusApp. '
                  'This includes:\n'
                  '- Delivering app features and services\n'
                  '- Enhancing app functionality and performance\n'
                  '- Communicating updates or important notifications',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Data Security
            Text(
              'Data Security',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We implement industry-standard security measures to protect your data. However, no method '
                  'of transmission over the Internet is 100% secure, and we cannot guarantee absolute security.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Third-Party Sharing
            Text(
              'Sharing Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We do not sell, trade, or rent your personal information to others. We may share data '
                  'with trusted third parties to provide better services, such as analytics and hosting.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Updates
            Text(
              'Policy Updates',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may update this Privacy Policy from time to time. Any changes will be communicated via '
                  'the app or email. We encourage you to review the policy periodically.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            // Contact Information
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at:\n\n'
                  'Email: support@nexusapp.com\n'
                  'Phone: +91 9408962204\n'
                  'Website: https://dev-aryanbhimani.pantheonsite.io/',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
