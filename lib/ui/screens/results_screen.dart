// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/widgets/results_widget.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ResultsScreeen extends StatelessWidget {
  final String query;
  const ResultsScreeen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Showing result for ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: screenSize.width / 3,
                  child: FittedBox(
                    child: ResultsWidget(
                      product: ProductModel(
                        url: amazonLogoUrl,
                        productName: 'Robot X Space',
                        cost: 20000.999,
                        discount: 0,
                        uid: 'ddfddfzd',
                        sellerName: 'Tyga Prince of Space',
                        sellerUid: 'ddfff',
                        rating: 3,
                        numOfRating: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
