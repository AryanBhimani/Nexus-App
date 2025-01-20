import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nexusapp/Components/Button.dart';
import 'package:nexusapp/Components/Colors.dart';
import 'package:nexusapp/Screens/Home/Home_screen.dart';
import 'package:nexusapp/Screens/Login/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Navigate to Home if user is logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomePage()),
        );
      } else {
        // Navigate to Login if user is not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class OnboardingInfo {
  final String title;
  final String description;
  final String image;

  OnboardingInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

// OnboardingData class
class OnboardingData {
  List<OnboardingInfo> items = [
    OnboardingInfo(
      title: "Nexus Hub",
      description: "Your central hub for chats, video calls, and group conversations.",
      image: "assets/Splash/Group Chat-amico.png",
    ),
    OnboardingInfo(
      title: "Nexus Connect",
      description: "Connect with friends through chat, video, and vibrant group experiences.",
      image: "assets/Splash/Messaging-amico.png",
    ),
    OnboardingInfo(
      title: "Nexus Link",
      description: "Linking you to seamless conversations, video calls, and meaningful group chats.",
      image: "assets/Splash/Video call-bro.png",
    ),
    OnboardingInfo(
      title: "Nexus Circle",
      description: "Enhanced chats, video conversations, and dynamic group connections your all-in-one app.",
      image: "assets/Splash/Texting-bro.png",
    ),
    OnboardingInfo(
      title: "Nexus Chat+",
      description: "Talk, see, and share with friends and groups—Nexus makes it easy.",
      image: "assets/Splash/Texting-amico.png",
    ),
  ];
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkOnboardingCompleted();
  }

  // Check if onboarding is completed
  Future<void> _checkOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    bool isOnboardingCompleted = prefs.getBool('isOnboardingCompleted') ?? false;

    if (isOnboardingCompleted) {
      // Navigate to the login page if onboarding is completed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    }
  }

  // Set onboarding as completed
  Future<void> _setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOnboardingCompleted', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Images
                        Image.asset(controller.items[currentIndex].image),
                        const SizedBox(height: 15),
                        // Titles
                        Text(
                          controller.items[currentIndex].title,
                          style: const TextStyle(
                            fontSize: 25,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            controller.items[currentIndex].description,
                            style: const TextStyle(color: black, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            buildDots(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                label: currentIndex == controller.items.length - 1
                    ? "Get started"
                    : "Continue",
                press: () {
                  setState(() {
                    if (currentIndex != controller.items.length - 1) {
                      currentIndex++;
                    } else {
                      // Mark onboarding as completed and navigate to login page
                      _setOnboardingCompleted();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dots
  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.items.length, (index) {
        return AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == index ? primaryColor : grey,
          ),
          height: 7,
          width: currentIndex == index ? 30 : 7,
          duration: const Duration(milliseconds: 700),
        );
      }),
    );
  }
}
