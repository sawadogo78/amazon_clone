// Note that the ressources folder  stand for database services, so services folder as you createas usual
import 'dart:typed_data';

import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/reviews_model.dart';
import 'package:amazon_clone/models/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class CloudFireStoreClass {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String rawcost,
    required int discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    // avoid blanck space issue in textfield
    productName.trim();
    rawcost.trim();
    String res = 'Something went wrong';

    if (image != null && productName.isNotEmpty && rawcost.isNotEmpty) {
      try {
        String uid = const Uuid().v4();
        String downloadUrl = await uploadImageToStorage(image: image, uid: uid);
        double cost = double.parse(rawcost);
        cost = cost - (cost * (discount / 100));

        ProductModel product = ProductModel(
            url: downloadUrl,
            productName: productName,
            cost: cost,
            discount: discount,
            uid: uid,
            sellerName: sellerName,
            sellerUid: sellerUid,
            rating: 5,
            numOfRating: 0);

        await _firestore.collection('products').doc(uid).set(
              product.toMap(),
            );

        res = 'success';
      } catch (e) {
        res = e.toString();
      }
    } else {
      res = "Please make sure all the field are not emppty";
    }
    return res;
  }

  Future<String> uploadImageToStorage(
      {required Uint8List image, required String uid}) async {
    Reference ref = _storage.ref().child('products').child(uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot task = await uploadTask;

    return task.ref.getDownloadURL();
  }

  // get product from discount

  Future<List<ProductModel>> getProductsFromDiscount(
      {required int discount}) async {
    final List<ProductModel> productsList = [];
    QuerySnapshot<Map<String, dynamic>> query = await _firestore
        .collection('products')
        .where('discount', isEqualTo: discount)
        .get();
    for (int i = 0; i < query.docs.length; i++) {
      // This is single document i
      final DocumentSnapshot documentSnapshot = query.docs[i];
      // document in json format, because it is in this format
      final docJson = documentSnapshot.data() as Map<String, dynamic>;
      final ProductModel product = ProductModel.fromJson(docJson);
      productsList.add(product);
    }
    return productsList;
  }

  Future uploadReviewToDatabase(
      {required String productUid, required ReviewModel reviewModel}) async {
    await _firestore
        .collection('products')
        .doc(productUid)
        .collection('reviews')
        .add(reviewModel.toMap());
  }

  // Function to add cart to cart
  Future addProductToCart({required ProductModel productModel}) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('cart')
        .doc(productModel.uid)
        .set(productModel.toMap());
  }

  Future deleateProductFromCart({required String uid}) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('cart')
        .doc(uid)
        .delete();
  }

  Future buyAllItemsInCart() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('cart')
        .get();

    for (int i = 0; i < snapshot.docs.length; i++) {
      ProductModel productModel =
          ProductModel.fromJson(snapshot.docs[i].data());
      // for each product, we add it to orders after clicking on buy button
      await addProductsToOrders(productModel: productModel);
    }
  }

  Future addProductsToOrders({required ProductModel productModel}) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('orders')
        .doc(productModel.uid)
        .set(productModel.toMap());
// After added product to orders, we deleate it from cart
    await deleateProductFromCart(uid: productModel.uid);
  }
}
