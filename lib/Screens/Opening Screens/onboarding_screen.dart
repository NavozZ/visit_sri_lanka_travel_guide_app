import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:visit_sri_lanka_travel_guide_app/Screens/Authetication%20Screens/auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/OnBoard%20Images%2F252a6624a42c117099537c7a1320256d%201.jpg?alt=media&token=07c76c93-1050-42b3-8e73-f2e6f58538e2",
      "title": "Life is short and the world is ",
      "highlight": "wide",
      "subtitle":
          "At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/OnBoard%20Images%2F7f47f9144194941%201.jpg?alt=media&token=0bbc4f35-b2a5-4cf5-9434-377e49acaa66",
      "title": "It‘s a big world out there go ",
      "highlight": "explore",
      "subtitle":
          "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    },
    {
      "image":
          "https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/OnBoard%20Images%2Fafbea499038243%201.jpg?alt=media&token=fa65b581-f402-4a30-9dae-1c653fc0070e",
      "title": "People don’t take trips, trips take ",
      "highlight": "people",
      "subtitle":
          "To get the best of your adventure you just need to leave and go where you like. We are waiting for you",
    },
  ];

  void finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_complete", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.network(
                          data["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: index != 2
                            ? TextButton(
                                onPressed: finishOnboarding,
                                child: const Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 3, 3)),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ]),
                    const SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        text: data["title"],
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: data["highlight"],
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data["subtitle"]!,
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 16),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(onboardingData.length, (dotIndex) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 8,
                          width: currentPage == dotIndex ? 24 : 8,
                          decoration: BoxDecoration(
                            color: currentPage == dotIndex
                                ? Colors.blue
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage == onboardingData.length - 1) {
                            finishOnboarding();
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(currentPage == onboardingData.length - 1
                            ? "Get Started"
                            : "Next"),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
