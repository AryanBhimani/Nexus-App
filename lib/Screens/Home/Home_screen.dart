import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart';
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

  final List<Widget> _screens = [
    Center(child: Text("Chat Screen")), 
    Center(child: Text("Account Screen")),
    SearchPage(),
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
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchPage()),);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: backgroundColor),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const Settings()),);
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: primaryColor),
                accountName: Text(
                  "Aryan Bhimani",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Aryan@gmail.com"),
                currentAccountPictureSize: Size.square(45),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 255, 234),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: primaryColor),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: const Text('Text Only'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Text with Image'),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text('Assistant'),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()),);
              },
            ),
          ],
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: primaryColor,
        selectedItemColor: backgroundColor,
        unselectedItemColor: black,
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