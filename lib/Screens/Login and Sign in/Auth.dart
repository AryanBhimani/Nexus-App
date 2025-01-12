import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Button.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Home_screen.dart';
import 'package:nexusapp/Screens/Login%20and%20Sign%20in/Login_screen.dart';
import 'package:nexusapp/Screens/Login%20and%20Sign%20in/SignUp_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return const HomePage();
          } else {
            return const AuthScreen();
          }
        }
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Jarvis AI App",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  const Text(
                    "Authenticate to access your vital information",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Expanded(child: Image.asset("assets/Data extraction-rafiki.png")),
                  Button(label: "Login", press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  }),
                  Button(label: "Sign Up", press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                  }
                ),
              ],
            ),
          ),        
        )
      ),
    );
  }
}