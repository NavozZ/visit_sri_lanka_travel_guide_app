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
      CollectionReference placesCollectionReference =
          FirebaseFirestore.instance.collection('places');

      final querySnapshot = await placesCollectionReference.get();

      List<Places> places = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final GeoPoint? location = data['location'];

        return Places(
          title: data['title'] ?? '',
          mainimage: data['main-image'] ?? '',
          description: data['description'] ?? '',
          moreinformation: data['more-information'] ?? '',
          otherImages: data.containsKey('other-images')
              ? List<String>.from(data['other-images'])
              : [],
          latitude: location?.latitude,
          longitude: location?.longitude,
        );
      }).toList();

      return places;
    } catch (e) {
      print('Error fetching places: $e');
      return [];
    }
  }

  //get example documents from Firebase DB and return Hotel type data
  static Future<List<Tours>> getTours() async {
    try {
      CollectionReference toursCollectionReference =
          FirebaseFirestore.instance.collection('tours');

      final querySnapshot = await toursCollectionReference.get();

      List<Tours> tours = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return Tours(
          title: data['title'] ?? '',
          mainimage: data['main-image'] ?? '',
          prices: Map<String, dynamic>.from(data["price"]),
          otherImages: data.containsKey('other-images')
              ? List<String>.from(data['other-images'])
              : [],
        );
      }).toList();

      return tours;
    } catch (e) {
      print('Error fetching tours: $e');
      return [];
    }
  }

  // //get example documents from Firebase DB and return tours type data
  // static Future<List<Tours>> getTours() async {
  //   // get data from Firebase DB
  //   CollectionReference toursCollectionReference =
  //       FirebaseFirestore.instance.collection('tours');

  //   final toursDocuments = await toursCollectionReference.get();

  //   toursCollectionReference.get().then((toursDocuments) {});

  //   List<Tours> tours = [];
  //   for (var toursDoc in toursDocuments.docs) {
  //     tours.add(Tours(
  //       title: toursDoc["title"],
  //       mainimage: toursDoc["main-image"],
  //       prices: Map<String, dynamic>.from(toursDoc["price"]),
  //       otherImages: toursDoc.containsKey('other-images')
  //             ? List<String>.from(toursDoc['other-images'])
  //             : [],
  //     ));
  //   }
  //   print(tours);
  //   return tours; // Return the list of places
  // }
}
