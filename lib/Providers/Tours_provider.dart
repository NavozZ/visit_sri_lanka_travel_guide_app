import 'package:flutter/material.dart';

import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';

class ToursProvider extends ChangeNotifier {
  List<Tours> _tours = [];

  int selectedToursTypeIndex = 0;

  addTours({required List<Tours> tours}) {
    _tours = tours;
    notifyListeners();
  }

  List<Tours> get toursData => _tours;
}
