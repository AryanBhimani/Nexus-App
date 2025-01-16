import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Message/Message.dart';
import 'package:nexusapp/Screens/Home/Search.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Nexus',
            style: TextStyle(
              color: backgroundColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.chat ,color: backgroundColor),
                child: Text(
                  "Chats", style: TextStyle(color: backgroundColor),
                ),
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined,color: backgroundColor),
                child: Text(
                  "Account", style: TextStyle(color: backgroundColor)
                ),
              ),
              Tab(
                icon: Icon(Icons.call,color: backgroundColor),
                child: Text(
                  "Call", style: TextStyle(color: backgroundColor),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: backgroundColor),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchPage()),);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: backgroundColor),
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginScreen()),);
              },
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Icon(Icons.home),
            ),
            Center(
              child: Icon(Icons.account_circle),
            ),
            Center(
              child: Icon(Icons.call),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Message()),);
          },
          child: const Icon(
            Icons.graphic_eq_outlined,
            color: backgroundColor,
          ),
        ),
      ),
    );
  }
}
