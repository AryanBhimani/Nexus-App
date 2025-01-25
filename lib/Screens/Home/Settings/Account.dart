import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:nexusapp/Components/Colors.dart';
// import 'package:nexusapp/Screens/Login/Login_screen.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final User? user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       Future.delayed(Duration.zero, () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()),
//         );
//       });
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/App Data/letter-n.png'),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     // user.displayName ?? 'User Name',
//                     'Aryan Bhimani',
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     user.email ?? 'Email not available',
//                     style: const TextStyle(fontSize: 16, color: black),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               'Settings',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.person, color: Colors.blue),
//               title: const Text('Edit Profile'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.lock, color: Colors.green),
//               title: const Text('Change Password'),
//               onTap: () {
//                 // Navigate to change password page
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.notifications, color: Colors.orange),
//               title: const Text('Notification Preferences'),
//               onTap: () {
//                 // Navigate to notification preferences page
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text('Logout'),
//               onTap: () async {
//                 await FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LoginScreen()),);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  // Example user data
  String name = "John Doe";
  String email = "johndoe@example.com";
  String bio = "Flutter Developer";

  // Controllers for editing
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current values
    nameController.text = name;
    emailController.text = email;
    bioController.text = bio;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void saveProfile() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      bio = bioController.text;
      isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_placeholder.png'),
              ),
              const SizedBox(height: 16),
              // Profile Details or Edit Form
              if (!isEditing) ...[
                Text(
                  name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  bio,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: const Text('Edit Profile'),
                ),
              ] else ...[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: saveProfile,
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
