import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Button.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Login/Login_screen.dart';
import 'package:nexusapp/service/Auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailname = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool isConfirmPasswordVisible = false;

  // Animation controllers and variables
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  Future<void> addUserDetails(String username, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'email': email,
      'password': password,
    });
  }

  @override
  void dispose() {
    emailname.dispose();
    password.dispose();
    confirmPassword.dispose();
    usernameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: const ListTile(
                        title: Text(
                          "Register New Account",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _opacityAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            children: [
                              _buildInputField(
                                controller: usernameController,
                                hintText: "User Name",
                                icon: Icons.account_circle,
                                validator: (value) =>
                                    value!.isEmpty ? "Username is required" : null,
                              ),
                              _buildInputField(
                                controller: emailname,
                                hintText: "Email",
                                icon: Icons.email,
                                validator: (value) =>
                                    value!.isEmpty ? "Email is required" : null,
                              ),
                              _buildInputField(
                                controller: password,
                                hintText: "Password",
                                icon: Icons.lock,
                                obscureText: !isVisible,
                                toggleVisibility: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                validator: (value) =>
                                    value!.isEmpty ? "Password is required" : null,
                              ),
                              _buildInputField(
                                controller: confirmPassword,
                                hintText: "Confirm Password",
                                icon: Icons.lock,
                                obscureText: !isConfirmPasswordVisible,
                                toggleVisibility: () {
                                  setState(() {
                                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Confirm password is required";
                                  } else if (password.text != confirmPassword.text) {
                                    return "Passwords don't match";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              SlideTransition(
                                position: _slideAnimation,
                                child: FadeTransition(
                                  opacity: _opacityAnimation,
                                  child: Button(
                                    label: "Sign Up",
                                    press: () async {
                                      if (formKey.currentState!.validate()) {
                                        try {
                                          // ignore: unused_local_variable
                                          final credential = await _auth.createUserWithEmailAndPassword(
                                            email: emailname.text.trim(),
                                            password: password.text.trim(),
                                          );

                                          // Add user details to Firestore
                                          addUserDetails(
                                            usernameController.text.trim(),
                                            emailname.text.trim(),
                                            password.text.trim(),
                                          );

                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Signup successful')),
                                          );

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                          );
                                        } on FirebaseAuthException catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Signup failed: ${e.message}')),
                                          );
                                        }
                                      }
                                    },
                                    width: MediaQuery.of(context).size.width * 0.9,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      AuthMethods().signInWithGoogle(context);
                                    },
                                    child: Image.asset(
                                      "assets/Login/google.png",
                                      height: 45,
                                      width: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 30.0),
                                  GestureDetector(
                                    onTap: (){
                                      AuthMethods().signInWithApple();
                                    },
                                    child: Image.asset(
                                      "assets/Login/apple.png",
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor.withOpacity(.2),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon),
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: toggleVisibility != null
              ? IconButton(
                  onPressed: toggleVisibility,
                  icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                )
              : null,
        ),
      ),
    );
  }
}
