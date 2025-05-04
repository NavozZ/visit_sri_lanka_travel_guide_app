import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final String location;
  final DateTime startDate;
  final DateTime endDate;

  Event({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  factory Event.fromFirestore(Map<String, dynamic> data) {
    return Event(
      title: data['title'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      category: data['category'],
      location: data['location'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }
}
