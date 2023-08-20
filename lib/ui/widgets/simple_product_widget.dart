// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/product_model.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const SimpleProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductScreen(productModel: productModel);
          },
        ));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}
