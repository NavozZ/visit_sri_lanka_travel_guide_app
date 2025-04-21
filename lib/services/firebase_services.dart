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
    try {
      // Reference to the "places" collection
      CollectionReference placesCollectionReference =
          FirebaseFirestore.instance.collection('places');

      // Fetch the documents
      final querySnapshot = await placesCollectionReference.get();

      // Convert documents to Places objects
      List<Places> places = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Places(
          title: data['title'] ?? '',
          mainimage: data['main-image'] ?? '',
          description: data['description'] ?? '',
          moreinformation: data['more-information'] ?? '',
          otherImages: data.containsKey('other-images')
              ? List<String>.from(data['other-images'])
              : [],
        );
      }).toList();

      return places;
    } catch (e) {
      print('Error fetching places: $e');
      return [];
    }
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
