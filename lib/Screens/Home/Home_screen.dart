// ignore: file_names
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: const ChatList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to create a new chat
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'John Doe',
        'message': 'Hey, how\'s it going?',
        'time': '10:45 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Jane Smith',
        'message': 'Can you send the files?',
        'time': '9:30 AM',
        'profilePic': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Mike Lee',
        'message': 'Let\'s catch up soon!',
        'time': 'Yesterday',
        'profilePic': 'https://via.placeholder.com/150',
      },
      
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ChatListItem(
          name: chat['name']!,
          message: chat['message']!,
          time: chat['time']!,
          profilePic: chat['profilePic']!,
        );
      },
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
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      onTap: () {
        // Navigate to the chat screen
      },
    );
  }
}