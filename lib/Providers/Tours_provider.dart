import 'package:flutter/material.dart';

import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';

class ToursProvider extends ChangeNotifier {
  List<Tours> _tours = [];

  int _selectedToursTypeIndex = 0;

  addTours({required List<Tours> tours}) {
    _tours = tours;
    notifyListeners();
  }

  // Optional: Add method to clear places
  void clearPlaces() {
    _tours.clear();
    notifyListeners();
  }

  // Getter for all places
  List<Tours> get toursData => _tours;

  // Getter for selected place type index
  int get selectedToursTypeIndex => _selectedToursTypeIndex;

  // Setter for selected index
  void setSelectedToursTypeIndex(int index) {
    _selectedToursTypeIndex = index;
    notifyListeners();
  }

  // Optional: Filtered places by type (if you have type field in Places)
  // List<Places> getPlacesByType(String type) {
  //   return _places.where((place) => place.type == type).toList();
  // }
}
