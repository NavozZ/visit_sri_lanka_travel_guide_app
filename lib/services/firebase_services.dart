import 'package:cloud_firestore/cloud_firestore.dart';

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
}
