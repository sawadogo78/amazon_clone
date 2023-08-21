// ignore_for_file: use_build_context_synchronously

import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:amazon_clone/ui/widgets/cart_item_widget.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/ui/widgets/user_details_bar.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
      body: Center(
        child: Stack(
          children: [
            const UserDetailsBar(
              offset: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('cart')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CustomMainButton(
                              color: yellowColor,
                              isLoading: true,
                              child: const Text(
                                "Loading...",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {},
                            );
                          } else {
                            return CustomMainButton(
                              color: yellowColor,
                              isLoading: false,
                              child: Text(
                                "Proceed to buy ${snapshot.data!.docs.length} items",
                                style: const TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                await CloudFireStoreClass().buyAllItemsInCart();
                                Utils().showSnackBar(
                                    context: context,
                                    content:
                                        'All products placed in orders section, thank you for your trust');
                              },
                            );
                          }
                        },
                      )),
                  Expanded(
                      child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('cart')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> dataJson =
                                snapshot.data!.docs[index].data();
                            ProductModel product =
                                ProductModel.fromJson(dataJson);
                            return CartItemWidget(product: product);
                          },
                        );
                      }
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
