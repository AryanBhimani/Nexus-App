import 'package:flutter/material.dart';
import 'package:nexusapp/Screens/Home/Message/chat.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> communities = [
      {
        'name': 'Flutter Developers',
        'description': 'A community for Flutter enthusiasts to share and learn.'
      },
      {
        'name': 'Tech Innovators',
        'description': 'Discussing the latest trends in technology and innovation.'
      },
      {
        'name': 'Open Source Coders',
        'description': 'Collaborate on open-source projects and contribute to the community.'
      },
      {
        'name': 'AI Enthusiasts',
        'description': 'Exploring advancements and projects in artificial intelligence.'
      },
      {
        'name': 'Mobile App Creators',
        'description': 'Building mobile apps with best practices and tools.'
      },
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Community'),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  communities[index]['name']![0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                communities[index]['name']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                communities[index]['description']!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const ChatPage()),);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Join'),
              ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ChatPage()),);
              },
            ),
          );
        },
      ),
    );
  }
}
