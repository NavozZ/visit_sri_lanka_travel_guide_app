import 'package:flutter/material.dart';

import 'package:visit_sri_lanka_travel_guide_app/widgets/TopicBar.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.network(
          'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f',
          fit: BoxFit.cover,
        ),
      ),
      TopicBar(
        Topic: " Destinations",
      ),
    ]));
  }
}
