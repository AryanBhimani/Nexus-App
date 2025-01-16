import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';

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
      appBar: AppBar(
        title: const Text('Search Page'),
        backgroundColor: primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
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
