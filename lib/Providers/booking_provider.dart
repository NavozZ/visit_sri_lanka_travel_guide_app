import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/booking.dart';

class BookingProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Booking>> get userBookingsStream {
    final user = _auth.currentUser;
    if (user == null) return const Stream.empty();

    return _firestore
        .collection('bookings')
        .where('userId', isEqualTo: user.uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Booking.fromMap(doc.data())).toList());
  }

  /// Add a new booking
  Future<void> addBooking(Booking booking) async {
    try {
      final docRef = _firestore.collection('bookings').doc(); // auto-id
      final bookingWithId = booking.copyWith(id: docRef.id);

      await docRef.set(bookingWithId.toMap());
    } catch (e) {
      print("Error adding booking: $e");
      rethrow;
    }
  }
}
