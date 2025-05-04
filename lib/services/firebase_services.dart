import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Places.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/Tours.dart';
import 'package:visit_sri_lanka_travel_guide_app/Models/event.dart';

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
          description: data['description'] ?? '',
          mainimage: data['main-image'] ?? '',
          prices: Map<String, dynamic>.from(data["price"]),
          visitingplaces: data.containsKey('visiting-places')
              ? List<String>.from(data['visiting-places'])
              : [],
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

  //get example documents from Firebase DB and return Hotel type data
  static Future<List<Event>> getEvents() async {
    try {
      CollectionReference eventsCollectionReference =
          FirebaseFirestore.instance.collection('events');

      final querySnapshot = await eventsCollectionReference.get();

      List<Event> events = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return Event(
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          imageUrl: data['imageUrl'] ?? '',
          category: data['category'] ?? '',
          location: data['location'] ?? '',
          startDate: (data['startDate'] as Timestamp).toDate(),
          endDate: (data['endDate'] as Timestamp).toDate(),
        );
      }).toList();

      return events;
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}
