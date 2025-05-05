import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';
import 'package:visit_sri_lanka_travel_guide_app/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/booking.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Tours tour;
  final DateTime selectedDate;
  final String priceType;
  final dynamic price;

  const BookingConfirmationPage({
    super.key,
    required this.tour,
    required this.selectedDate,
    required this.priceType,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Confirmation"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      tour.mainimage ?? '',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tour.title ?? 'Tour Title',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              "Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.category, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              "Tour Type: ${_capitalizeWords(priceType)}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.attach_money, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              "Price: \$${price.toString()}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              btntext: "Confirm Booking",
              onTap: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("You must be logged in to book."),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  return;
                }

                final bookingId =
                    FirebaseFirestore.instance.collection('bookings').doc().id;

                final booking = Booking(
                  id: bookingId,
                  userId: user.uid,
                  tourId: tour.id!,
                  tourTitle: tour.title ?? '',
                  bookingDate: selectedDate,
                  priceType: priceType,
                  price: price,
                  createdAt: DateTime.now(),
                );

                try {
                  await FirebaseFirestore.instance
                      .collection('bookings')
                      .doc(bookingId)
                      .set(booking.toMap());

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tour booked successfully!"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Failed to book: $e"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _capitalizeWords(String text) {
    return text
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
