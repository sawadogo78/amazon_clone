// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/ui/widgets/cost_widget.dart';
import 'package:amazon_clone/ui/widgets/rating_star_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/product_model.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                product.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width / 6,
                    child: FittedBox(
                      child: RatingStarWidget(
                        rating: product.rating,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      product.numOfRating.toString(),
                      style: const TextStyle(
                        color: activeCyanColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: CostWidget(
                  color: const Color.fromARGB(255, 91, 21, 16),
                  cost: product.cost,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
