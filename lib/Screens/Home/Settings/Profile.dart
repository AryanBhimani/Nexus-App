import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        foregroundColor: backgroundColor,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/App Data/letter-n.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.displayName ?? 'User Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.email ?? 'Email not available',
                    style: const TextStyle(fontSize: 16, color: black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildProfileOption(
              context,
              icon: Icons.person,
              color: Colors.blue,
              text: 'Edit Profile',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.lock,
              color: Colors.green,
              text: 'Change Password',
              onTap: () {
                // Add change password functionality
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.notifications,
              color: Colors.orange,
              text: 'Notification Preferences',
              onTap: () {
                // Add notification preferences functionality
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.logout,
              color: Colors.red,
              text: 'Logout',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, {required IconData icon, required Color color, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      onTap: onTap,
    );
  }
}




// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   bool isEditing = false;

//   late User user;
//   String name = "John Doe";
//   String email = "johndoe@example.com";
//   String bio = "Flutter Developer";

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser!;
//     nameController.text = user.displayName ?? name;
//     emailController.text = user.email ?? email;
//     bioController.text = bio;
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     bioController.dispose();
//     super.dispose();
//   }

//   void saveProfile() async {
//     setState(() {
//       isEditing = false;
//     });

//     try {
//       // Update the FirebaseAuth user's profile information
//       await user.updateDisplayName(nameController.text);
//       await user.updateEmail(emailController.text);
//       await user.reload(); // Reload the user to reflect the updated information

//       // You can also update additional info in the Firebase Realtime Database or Firestore if needed.
//       final userRef = FirebaseDatabase.instance.ref('users/${user.uid}');
//       await userRef.update({
//         'name': nameController.text,
//         'email': emailController.text,
//         'bio': bioController.text,
//       });

//       // Update the state with the new data
//       setState(() {
//         name = nameController.text;
//         email = emailController.text;
//         bio = bioController.text;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/profile_placeholder.png'),
//               ),
//               const SizedBox(height: 16),
//               if (!isEditing) ...[
//                 Text(
//                   name,
//                   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   email,
//                   style: const TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   bio,
//                   style: const TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isEditing = true;
//                     });
//                   },
//                   child: const Text('Edit Profile'),
//                 ),
//               ] else ...[
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: bioController,
//                   decoration: const InputDecoration(
//                     labelText: 'Bio',
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 3,
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           isEditing = false;
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                       child: const Text('Cancel'),
//                     ),
//                     ElevatedButton(
//                       onPressed: saveProfile,
//                       child: const Text('Save Changes'),
//                     ),
//                   ],
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   bool isEditing = false;

//   late User user;
//   String name = "John Doe";
//   String email = "johndoe@example.com";
//   String bio = "Flutter Developer";

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser!;
//     nameController.text = user.displayName ?? name;
//     emailController.text = user.email ?? email;
//     bioController.text = bio;
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     bioController.dispose();
//     super.dispose();
//   }

//   void saveProfile() async {
//     setState(() {
//       isEditing = false;
//     });

//     try {
//       // Update the FirebaseAuth user's profile information
//       await user.updateDisplayName(nameController.text);
//       await user.updateEmail(emailController.text);
//       await user.reload(); // Reload the user to reflect the updated information

//       // You can also update additional info in the Firebase Realtime Database or Firestore if needed.
//       final userRef = FirebaseDatabase.instance.ref('users/${user.uid}');
//       await userRef.update({
//         'name': nameController.text,
//         'email': emailController.text,
//         'bio': bioController.text,
//       });

//       // Update the state with the new data
//       setState(() {
//         name = nameController.text;
//         email = emailController.text;
//         bio = bioController.text;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Profile Picture
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(user.photoURL ?? 'https://www.example.com/default-profile.png'),
//               ),
//               const SizedBox(height: 24),
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                     contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                     contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           isEditing = false;
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.redAccent,
//                         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: const Text('Cancel', style: TextStyle(fontSize: 16)),
//                     ),
//                     ElevatedButton(
//                       onPressed: saveProfile,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.greenAccent,
//                         padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
//                     ),
//                   ],
//                 ),
//               ],
//           ),
//         ),
//       ),
//     );
//   }
// }




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  late User user;
  String name = "John Doe";
  String email = "johndoe@example.com";
  String bio = "Flutter Developer";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      user = FirebaseAuth.instance.currentUser!;
      nameController.text = user.displayName ?? name;
      emailController.text = user.email ?? email;
      bioController.text = bio;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: User not logged in!')));
      // Redirect to login page or handle accordingly
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void saveProfile() async {
    setState(() {
      isEditing = false;
    });

    try {
      // Check if user is logged in
      // ignore: unnecessary_null_comparison
      if (user != null) {
        // Update the FirebaseAuth user's profile information
        await user.updateDisplayName(nameController.text);
        await user.updateEmail(emailController.text);
        await user.reload(); // Reload the user to reflect the updated information

        // You can also update additional info in the Firebase Realtime Database or Firestore if needed.
        final userRef = FirebaseDatabase.instance.ref('users/${user.uid}');
        await userRef.update({
          'name': nameController.text,
          'email': emailController.text,
          'bio': bioController.text,
        });

        // Update the state with the new data
        setState(() {
          name = nameController.text;
          email = emailController.text;
          bio = bioController.text;
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error: User not logged in!')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.photoURL ?? 'https://www.example.com/default-profile.png'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
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
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Cancel', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
