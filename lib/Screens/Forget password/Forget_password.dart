import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexusapp/Components/Button.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController mailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Password Reset Email has been sent!",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "No user found for that email.",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,  // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70.0),
              Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  "Password Recovery",
                  style: TextStyle(
                    color: black,  // Change text color to black for contrast
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Enter your email to reset password",
                style: TextStyle(
                  color: black,  // Change text color to black87 for better readability
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: black, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,
                        style: const TextStyle(color: black),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 18.0, color: black),
                          prefixIcon: Icon(
                            Icons.email,
                            color: black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Button(
                      label: "Send Reset Email",
                      press: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                    ),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: black,  // Update color for readability
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create one",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}