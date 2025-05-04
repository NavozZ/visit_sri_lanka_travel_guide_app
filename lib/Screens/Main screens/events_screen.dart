import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/Providers/event_provider.dart';

import 'package:visit_sri_lanka_travel_guide_app/widgets/TopicBar.dart';
import 'package:visit_sri_lanka_travel_guide_app/widgets/eventCard.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the events when the screen loads
    Provider.of<EventProvider>(context, listen: false).fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final events = eventProvider.eventsData;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: TopicBar(topic: "Events"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/travel-guide-app-f9c00.firebasestorage.app/o/assets%2Fdownload%20(9)%201.jpg?alt=media&token=b9867aeb-594d-4859-8d51-8f09dedaf78f',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 120, left: 12, right: 12), // space below appbar
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];

                // Make sure startDate and endDate are DateTime objects
                DateTime startDate = event.startDate;
                DateTime endDate = event.endDate;

                return EventCard(
                    event: event, startDate: startDate, endDate: endDate);
              },
            ),
          ),
        ],
      ),
    );
  }
}
