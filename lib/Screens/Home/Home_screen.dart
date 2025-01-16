import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart';
import 'package:nexusapp/Screens/Home/Settings/Settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: const TabBar(
            labelColor: backgroundColor,
            tabs: [
              Tab(
                icon: Icon(Icons.chat),
                child: Text("Chats"),
              ),
              Tab(
                icon: Icon(Icons.account_box_outlined),
                child: Text("Account"),
              ),
              Tab(
                icon: Icon(Icons.call),
                child: Text("Call"),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: backgroundColor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: backgroundColor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
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
            SearchPage(),
          ],
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
      ),
    );
  }
}





class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = [
    'aryan',
    'bhimani',
    'AryanBHimani',
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Kiwi',
    'Lemon',
    'Mango',
    'Peach',
    'Plum'
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _filterSearchResults(String query) {
    List<String> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredList = _items;
    }
    setState(() {
      _filteredItems = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterSearchResults,
              decoration: const InputDecoration(
                hintText: 'Search here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                    onTap: () {
                      // You can navigate to a details page or perform other actions
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
