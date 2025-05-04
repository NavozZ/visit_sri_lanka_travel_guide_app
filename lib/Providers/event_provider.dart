import 'package:flutter/material.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/event.dart';
import 'package:visit_sri_lanka_travel_guide_app/services/firebase_services.dart'; // <-- Your Firebase service

class EventProvider extends ChangeNotifier {
  var _events = <Event>[];
  int _selectedEventCategoryIndex = 0;

  List<Event> get eventsData => _events;
  int get selectedEventCategoryIndex => _selectedEventCategoryIndex;

  void setSelectedEventCategoryIndex(int index) {
    _selectedEventCategoryIndex = index;
    notifyListeners();
  }

  Future<void> fetchEvents() async {
    final fetchedEvents = await FirebaseServices.getEvents();
    _events = fetchedEvents;
    notifyListeners();
  }

  List<Event> getEventsByCategory(String category) {
    if (category == "All") return _events;
    return _events.where((event) => event.category == category).toList();
  }
}
