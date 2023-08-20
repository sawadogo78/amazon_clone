// Note that the ressources folder  stand for database services, so services folder as you createas usual
import 'package:amazon_clone/models/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFireStoreClass {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to store user data to cloud firestore

  Future uploadNameAddressToDatabase(
      {required UserDetailsModel userModel}) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
          userModel.toMap(),
        );
  }

  Future<UserDetailsModel> getUserNameAndAddress() async {
    final DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
    final Map<String, dynamic> userDetails =
        snapshot.data() as Map<String, dynamic>;

    return UserDetailsModel.fromJson(userDetails);
  }
}
