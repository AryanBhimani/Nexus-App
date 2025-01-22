import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> calls = [
      {'name': 'Aryan Bhimani', 'time': 'Today, 10:30 AM'},
      {'name': 'John Doe', 'time': 'Yesterday, 5:45 PM'},
      {'name': 'Jane Smith', 'time': 'Yesterday, 3:15 PM'},
      {'name': 'Alice Johnson', 'time': '2 days ago, 9:00 AM'},
      {'name': 'Bob Brown', 'time': '2 days ago, 8:15 PM'},
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Calls'),
      //   centerTitle: true,
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: calls.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  calls[index]['name']![0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                calls[index]['name']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                calls[index]['time']!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () {
                  // Action for making a call
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
