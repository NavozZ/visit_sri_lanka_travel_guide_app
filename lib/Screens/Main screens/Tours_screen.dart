import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/Tours_provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/widgets/TopicBar.dart';
import 'package:visit_sri_lanka_travel_guide_app/widgets/TourCard.dart';

class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  final String _backgroundImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Optional: allows content to go under AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust the height as needed
        child: TopicBar(
          topic: "Tours",
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              _backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),

          // Search Box
          Positioned(
            top: 130,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Tours...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey[700]),
                ),
              ),
            ),
          ),

          Positioned.fill(
            top: 200, // Give it space below the search bar
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 80),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0, // Control height better
              ),
              itemCount: context.read<ToursProvider>().toursData.length,
              itemBuilder: (BuildContext context, int index) {
                return TourCard(
                  toursData: context.read<ToursProvider>().toursData[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
