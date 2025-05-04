import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/booking.dart';
import 'package:visit_sri_lanka_travel_guide_app/Providers/booking_provider.dart';

class BookingListPage extends StatelessWidget {
  const BookingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<List<Booking>>(
        stream: Provider.of<BookingProvider>(context).userBookingsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final bookings = snapshot.data ?? [];

          if (bookings.isEmpty) {
            return const Center(child: Text("No bookings found."));
          }

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.tour, color: Colors.teal),
                  title: Text(booking.tourTitle),
                  subtitle: Text(
                    "Date: ${DateFormat('yyyy-MM-dd').format(booking.bookingDate)}\n"
                    "Type: ${_capitalize(booking.priceType)}\n"
                    "Price: \$${booking.price}",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _capitalize(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}
