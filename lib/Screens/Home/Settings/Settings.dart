import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Settings/About.dart';
import 'package:nexusapp/Screens/Home/Settings/Privacy.dart';
import 'package:nexusapp/Screens/Home/Settings/Profile.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: backgroundColor,
        backgroundColor: primaryColor,
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          // Account settings
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Account'),
            subtitle: Text('Manage your account settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  profile()),);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.red),
            title: Text('Privacy'),
            subtitle: Text('Adjust privacy options'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  PrivacyPage()),);
            },
          ),
          Divider(),

          // Dark mode toggle
          SwitchListTile(
            title: Text('Dark Mode'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
              print('Dark Mode: $_darkMode');
            },
            secondary: Icon(Icons.dark_mode, color: Colors.grey),
          ),
          Divider(),

          // Notifications toggle
          SwitchListTile(
            title: Text('Notifications'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
              print('Notifications: $_notifications');
            },
            secondary: Icon(Icons.notifications, color: Colors.green),
          ),
          Divider(),

          // About section
          ListTile(
            leading: Icon(Icons.info, color: Colors.orange),
            title: Text('About'),
            subtitle: Text('Learn more about this app'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  AboutPage()),);
            },
          ),
          Divider(),

          // Log Out
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.red),
            title: Text('Log Out'),
            subtitle: Text('User LogOut'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginScreen()),);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}