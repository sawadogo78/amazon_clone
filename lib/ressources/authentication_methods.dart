import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CloudFireStoreClass _fireStoreClass = CloudFireStoreClass();
  Future<String> signUpUser({
    required String name,
    required String address,
    required String email,
    required String password,
  }) async {
    // Trim to avoid a blank space error
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String res = "Some error occured";
    if (name.isNotEmpty &&
        address.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        final UserDetailsModel user = UserDetailsModel(
          name: name,
          address: address,
        );
        await _fireStoreClass.uploadNameAddressToDatabase(
          userModel: user,
        );
        res = 'success';
      } on FirebaseAuthException catch (e) {
        res = e.message.toString();
      }
    } else {
      res = "Please Fields must not be empty";
    }

    return res;
  }

  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    // Trim to avoid a blank space error
    email.trim();

    password.trim();

    String res = "Some error occured";
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } on FirebaseAuthException catch (e) {
        res = e.message.toString();
      }
    } else {
      res = "Please Fields must not be empty";
    }

    return res;
  }
}
