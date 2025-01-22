// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final List<String> _items = [
//     'aryan',
//     'bhimani',
//     'AryanBHimani',
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Date',
//     'Grape',
//     'Kiwi',
//     'Lemon',
//     'Mango',
//     'Peach',
//     'Plum'
//   ];
//   List<String> _filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredItems = _items;
//   }

//   void _filterSearchResults(String query) {
//     List<String> filteredList = [];
//     if (query.isNotEmpty) {
//       filteredList = _items
//           .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     } else {
//       filteredList = _items;
//     }
//     setState(() {
//       _filteredItems = filteredList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _searchController,
//               onChanged: _filterSearchResults,
//               decoration: const InputDecoration(
//                 hintText: 'Search here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredItems.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_filteredItems[index]),
//                     onTap: () {
//                       // You can navigate to a details page or perform other actions
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }  


import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterSearchResults,
              decoration: InputDecoration(
                hintText: 'Search here...',
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            title: Text(
                              _filteredItems[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // Perform actions or navigate to details
                            },
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No items found',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
