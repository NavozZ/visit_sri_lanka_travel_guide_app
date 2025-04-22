import 'package:flutter/material.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';

class PlacesProvider extends ChangeNotifier {
  List<Places> _places = [];
  int _selectedPlacesTypeIndex = 0;

  // Setter for places
  void addPlaces({required List<Places> places}) {
    _places = places;
    notifyListeners();
  }

  // Optional: Add method to clear places
  void clearPlaces() {
    _places.clear();
    notifyListeners();
  }

  // Getter for all places
  List<Places> get placesData => _places;

  // Getter for selected place type index
  int get selectedPlacesTypeIndex => _selectedPlacesTypeIndex;

  // Setter for selected index
  void setSelectedPlacesTypeIndex(int index) {
    _selectedPlacesTypeIndex = index;
    notifyListeners();
  }

  // Optional: Filtered places by type (if you have type field in Places)
  // List<Places> getPlacesByType(String type) {
  //   return _places.where((place) => place.type == type).toList();
  // }
}
