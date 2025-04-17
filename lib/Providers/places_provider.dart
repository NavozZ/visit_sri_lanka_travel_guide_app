import 'package:flutter/material.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';

class PlacesProvider extends ChangeNotifier {
  List<Places> _places = [];

  int selectedPlacesTypeIndex = 0;

  addPlaces({required List<Places> places}) {
    _places = places;
    notifyListeners();
  }

  List<Places> get placesData => _places;
}
