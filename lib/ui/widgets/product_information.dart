// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/ui/widgets/cost_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget({
    Key? key,
    required this.productName,
    required this.cost,
    required this.sellerName,
  }) : super(key: key);

  static const space = SizedBox(
    height: 7,
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: const TextStyle(
                letterSpacing: 0.7,
                fontWeight: FontWeight.w500,
                fontSize: 17,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          space,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWidget(
                color: Colors.black,
                cost: cost,
              ),
            ),
          ),
          space,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sold by',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: sellerName,
                    style: const TextStyle(
                      color: activeCyanColor,
                      fontSize: 14,
                      letterSpacing: 0.8,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
