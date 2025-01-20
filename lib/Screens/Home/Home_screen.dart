// // import 'package:flutter/material.dart';
// // import 'package:nexusapp/Components/Colors.dart';
// // import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart';
// // import 'package:nexusapp/Screens/Home/Settings/Settings.dart';
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 3,
// //       child: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: primaryColor,
// //           foregroundColor: backgroundColor,
// //           title: const Text(
// //             'Nexus',
// //             style: TextStyle(
// //               fontSize: 24,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           bottom: const TabBar(
// //             labelColor: backgroundColor,
// //             tabs: [
// //               Tab(
// //                 icon: Icon(Icons.chat),
// //                 child: Text("Chats"),
// //               ),
// //               Tab(
// //                 icon: Icon(Icons.account_box_outlined),
// //                 child: Text("Account"),
// //               ),
// //               Tab(
// //                 icon: Icon(Icons.call),
// //                 child: Text("Call"),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             IconButton(
// //               icon: const Icon(Icons.search, color: backgroundColor),
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
// //               },
// //             ),
// //             IconButton(
// //               icon: const Icon(Icons.settings, color: backgroundColor),
// //               onPressed: () {
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
// //               },
// //             ),
// //           ],
// //         ),
// //         body: const TabBarView(
// //           children: [
// //             Center(
// //               child: Icon(Icons.home),
// //             ),
// //             Center(
// //               child: Icon(Icons.account_circle),
// //             ),
// //             SearchPage(),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           backgroundColor: primaryColor,
// //           onPressed: () {
// //             Navigator.push(context, MaterialPageRoute(builder: (context) => const Message()));
// //           },
// //           child: const Icon(
// //             Icons.graphic_eq_outlined,
// //             color: backgroundColor,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:nexusapp/Components/Colors.dart';
// import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart';// Assuming SearchPage.dart
// import 'package:nexusapp/Screens/Home/Settings/Settings.dart'; // Assuming Settings.dart

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: primaryColor,
//           foregroundColor: backgroundColor,
//           title: const Text(
//             'Nexus',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           bottom: const TabBar(
//             labelColor: backgroundColor,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(icon: Icon(Icons.chat), text: "Chats"),
//               Tab(icon: Icon(Icons.account_box_outlined), text: "Account"),
//               Tab(icon: Icon(Icons.call), text: "Call"),
//             ],
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.search, color: backgroundColor),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SearchPage()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.settings, color: backgroundColor),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Settings()),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: const TabBarView(
//           children: [
//             // Replace with actual screen widgets
//             Center(child: Text("Chat Screen")),
//             Center(child: Text("Account Screen")),
//             Center(child: Text("Call Screen")),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: primaryColor,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const Message()),
//             );
//           },
//           child: const Icon(
//             Icons.graphic_eq_outlined,
//             color: backgroundColor,
//           ),
//         ),
//       ),
//     );
//   }
// }


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


// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   // Navigation options (e.g., Chat, Contacts, Settings)
//   static const List<Widget> _pages = <Widget>[
//     Center(child: Text('Chat Screen', style: TextStyle(fontSize: 24))),
//     Center(child: Text('Contacts Screen', style: TextStyle(fontSize: 24))),
//     SearchPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nexus'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Action for search
//             },
//           ),
//         ],
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.contacts),
//             label: 'Contacts',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.call),
//             label: 'Calls',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/images/chat.png'),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'NexusApp',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                     ),
//                   ),
//                   Text(
//                     'Your seamless chat solution',
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text('About'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/about');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.privacy_tip),
//               title: Text('Privacy Policy'),
//               onTap: () {
//                 Navigator.pushNamed(context, '/privacy');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 // Add logout logic
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Message/AI%20Chat.dart'; // Assuming Message.dart
import 'package:nexusapp/Screens/Home/Settings/Settings.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart'; // Assuming Settings.dart

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("Chat Screen")), // Replace with actual Chat screen widget
    Center(child: Text("Account Screen")), // Replace with actual Account screen widget
    Center(child: Text("Call Screen")), // Replace with actual Call screen widget
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: backgroundColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
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
                accountEmail: Text("AryanBhimani@gmail.com"),
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
                Navigator.pop(context);
                Navigator.pushNamed(context, '/TextOnly');
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Text with Image'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/TextWithImage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text('Assistant'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Assistant');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Message()),
          );
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