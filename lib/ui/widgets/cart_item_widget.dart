// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:amazon_clone/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/ui/widgets/custom_square_button.dart';
import 'package:amazon_clone/ui/widgets/product_information.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return Container(
      padding: const EdgeInsets.all(25.0),
      height: screenSize.height / 2,
      width: screenSize.width / 2,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: backgroundColor,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductScreen(productModel: product);
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Center(
                        child: Image.network(
                          product.url,
                        ),
                      ),
                    ),
                  ),
                  ProductInformationWidget(
                    productName: product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                CustomSquareButton(
                  onPressed: () {},
                  color: backgroundColor,
                  dimension: 50,
                  child: const Icon(Icons.remove),
                ),
                CustomSquareButton(
                  onPressed: () {},
                  color: Colors.white,
                  dimension: 50,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: activeCyanColor,
                    ),
                  ),
                ),
                CustomSquareButton(
                  onPressed: () async {
                    // to do that, we gonna add the same product will another uid
                    final String newuid = const Uuid().v4();
                    await CloudFireStoreClass().addProductToCart(
                      productModel: ProductModel(
                        url: product.url,
                        productName: product.productName,
                        cost: product.cost,
                        discount: product.discount,
                        uid: newuid,
                        sellerName: product.sellerName,
                        sellerUid: product.sellerUid,
                        rating: product.rating,
                        numOfRating: product.numOfRating,
                      ),
                    );
                  },
                  color: backgroundColor,
                  dimension: 50,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomSimpleRoundedButton(
                          onPressed: () async {
                            await CloudFireStoreClass()
                                .deleateProductFromCart(uid: product.uid);
                          },
                          text: 'Delete',
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        CustomSimpleRoundedButton(
                          onPressed: () {},
                          text: 'Save for later',
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'See more of this',
                          style: TextStyle(color: activeCyanColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
