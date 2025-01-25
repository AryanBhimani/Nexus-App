import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for chats
    final List<Map<String, String>> chats = [
      {
        "name": "Alice Johnson",
        "lastMessage": "Hey! How are you?",
        "time": "10:30 AM",
        "avatar": "assets/App Data/caht.png",
      },
      {
        "name": "Bob Smith",
        "lastMessage": "Let's catch up later.",
        "time": "9:15 AM",
        "avatar": "assets/App Data/caht.png",
      },
      {
        "name": "Charlie Brown",
        "lastMessage": "Great, see you then!",
        "time": "Yesterday",
        "avatar": "assets/App Data/caht.png",
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return InkWell(
            onTap: () {
              // Navigate to chat details or message page
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chat["avatar"]!),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat["name"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          chat["lastMessage"]!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    chat["time"]!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
