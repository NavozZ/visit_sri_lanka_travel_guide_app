import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date

import 'package:visit_sri_lanka_travel_guide_app/Models/event.dart'; // Event model import

class EventCard extends StatelessWidget {
  final Event event;
  final DateTime startDate;
  final DateTime endDate;

  const EventCard({
    required this.event,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              event.imageUrl,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "${DateFormat('MMM dd').format(startDate)} - ${DateFormat('MMM dd').format(endDate)}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  event.location,
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
