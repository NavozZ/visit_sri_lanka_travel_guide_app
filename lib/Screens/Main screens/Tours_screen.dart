import 'package:flutter/material.dart';
import 'package:visit_sri_lanka_travel_guid_application/widgets/TopicBar.dart';

class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
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
        Topic: " Tours",
      )
    ]));
  }
}
