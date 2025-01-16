import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Message/Message.dart';
import 'package:nexusapp/Screens/Home/Search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Nexus',
          style: TextStyle(
            color: backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search , color: backgroundColor),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchPage()),);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const Message()),);
        },
        child: const Icon (Icons.graphic_eq_outlined, color: black),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String profilePic;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.profilePic,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profilePic),
        radius: 25,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(
          color: grey,
          fontSize: 12,
        ),
      ),
      onTap: () {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => const Message()),);
      },
    );
  }
}