import 'package:flutter/material.dart';

class TopicBar extends StatelessWidget {
  final String Topic;

  const TopicBar({
    super.key,
    required this.Topic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(children: [
        // Background image for the topic bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100, // Height of the topic bar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2FRectangle%2013%201.jpg?alt=media&token=e9aa3f31-2fa1-483d-a347-b6a20d3f0624',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Topic text over the background image
        Positioned(
          top: 30, // Adjust this value to position the text vertically
          left: 20,

          child: Column(
            children: [
              Text(
                Topic,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
