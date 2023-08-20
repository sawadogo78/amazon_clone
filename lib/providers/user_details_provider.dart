import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:flutter/foundation.dart';

class UserDetailsProvider extends ChangeNotifier {
  final CloudFireStoreClass _cloudFireStoreService = CloudFireStoreClass();
  UserDetailsModel userDetailsModel;

  // To prevent not query from the app, that why I initilize this constructor
  UserDetailsProvider()
      : userDetailsModel =
            UserDetailsModel(name: 'Loading', address: 'Loading');

  Future getData() async {
    userDetailsModel = await _cloudFireStoreService.getUserNameAndAddress();
    // Notify Listener, never forget it
    notifyListeners();
  }
}
