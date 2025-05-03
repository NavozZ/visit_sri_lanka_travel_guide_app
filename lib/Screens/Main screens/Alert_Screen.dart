import 'package:flutter/material.dart';

import 'package:visit_sri_lanka_travel_guide_app/widgets/TopicBar.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Optional: allows content to go under AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust the height as needed
        child: TopicBar(
          topic: "Notification",
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f',
              fit: BoxFit.cover,
            ),
          ),
          // Add your other content here if needed
        ],
      ),
    );
  }
}
