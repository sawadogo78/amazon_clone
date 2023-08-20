import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/reviews_model.dart';
import 'package:amazon_clone/ui/widgets/cost_widget.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/ui/widgets/rating_star_widget.dart';
import 'package:amazon_clone/ui/widgets/reviews_dialog.dart';
import 'package:amazon_clone/ui/widgets/reviews_widget.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/ui/widgets/user_details_bar.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({super.key, required this.productModel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    final Expanded space = Expanded(child: Container());
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + kAppBarHeight / 2),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        widget.productModel.sellerName,
                                        style: const TextStyle(
                                          color: activeCyanColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.productModel.productName,
                                    )
                                  ],
                                ),
                                RatingStarWidget(
                                    rating: widget.productModel.rating)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3,
                              ),
                              child: Image.network(
                                widget.productModel.url,
                              ),
                            ),
                          ),
                          space,
                          CostWidget(
                            color: Colors.black,
                            cost: widget.productModel.cost,
                          ),
                          space,
                          CustomMainButton(
                            color: Colors.orange,
                            isLoading: false,
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          space,
                          CustomMainButton(
                            color: yellowColor,
                            isLoading: false,
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          space,
                          CustomSimpleRoundedButton(
                            onPressed: () {
                              // show the dialog
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    true, // set to false if you want to force a rating
                                builder: (context) => const ReviewDialog(),
                              );
                            },
                            text: 'Add a review for this product',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                      child: ListView.builder(
                        itemCount: widget.productModel.numOfRating,
                        itemBuilder: (context, index) {
                          return ReviewWidget(
                            reviewModel: ReviewModel(
                                senderName: 'Roxane Space',
                                description:
                                    'Nice product, I love purchasing in Amazon because they always have good products at good price',
                                rating: 3),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const UserDetailsBar(
              offset: 0,
            ),
          ],
        ),
      ),
    );
  }
}
