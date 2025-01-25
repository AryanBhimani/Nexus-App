import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Calls/Calls.dart';
import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart';
import 'package:nexusapp/Screens/Home/Message/Contacts.dart';
import 'package:nexusapp/Screens/Home/Settings/Account.dart';
import 'package:nexusapp/Screens/Home/Search.dart';
import 'package:nexusapp/Screens/Home/Settings/Settings.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final User? user = FirebaseAuth.instance.currentUser;

  final List<Widget> _screens = [
    ChatsPage(),
    AccountPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        title: const Text(
          'Nexus',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: backgroundColor),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: backgroundColor),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: primaryColor),
                accountName: Text(
                  user?.displayName ?? 'No name available',
                  style: const TextStyle(fontSize: 18, color: backgroundColor),
                ),
                accountEmail: Text(
                  user!.email ?? 'Email not available',
                  style: const TextStyle(fontSize: 16, color: backgroundColor),
                ),
                currentAccountPictureSize: const Size.square(45),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 255, 234),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: primaryColor),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Message()));
        },
        child: const Icon(
          Icons.graphic_eq_outlined,
          color: backgroundColor,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: primaryColor,
        selectedItemColor: backgroundColor,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
    );
  }
}
