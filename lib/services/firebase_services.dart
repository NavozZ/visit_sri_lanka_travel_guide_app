import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';

class FirebaseServices {
  static addSignUpData(
      {required String email,
      required String name,
      required String adress,
      required String mobileNo}) {
    CollectionReference userCollectionReference =
        FirebaseFirestore.instance.collection('users');

    userCollectionReference.add({
      "email": email,
      "name": name,
      "adress": adress,
      "mobile_number": mobileNo
    });
  }

  //get example documents from Firebase DB and return Hotel type data
  static Future<List<Places>> getPlaces() async {
    // get data from Firebase DB
    CollectionReference placesCollectionReference =
        FirebaseFirestore.instance.collection('places');

    final placesDocuments = await placesCollectionReference.get();

    placesCollectionReference.get().then((placesDocuments) {});

    List<Places> places = [];
    for (var placesDoc in placesDocuments.docs) {
      places.add(Places(
        title: placesDoc["title"],
        mainimage: placesDoc["main-image"],
        description: placesDoc["description"],
      ));
    }
    print(places);
    return places; // Return the list of places
  }

  //get example documents from Firebase DB and return tours type data
  static Future<List<Tours>> getTours() async {
    // get data from Firebase DB
    CollectionReference toursCollectionReference =
        FirebaseFirestore.instance.collection('tours');

    final toursDocuments = await toursCollectionReference.get();

    toursCollectionReference.get().then((toursDocuments) {});

    List<Tours> tours = [];
    for (var toursDoc in toursDocuments.docs) {
      tours.add(Tours(
        title: toursDoc["title"],
        mainimage: toursDoc["main-image"],
        prices: Map<String, dynamic>.from(toursDoc["price"]),
      ));
    }
    print(tours);
    return tours; // Return the list of places
  }
}
