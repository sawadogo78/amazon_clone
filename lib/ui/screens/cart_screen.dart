import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/widgets/cart_item_widget.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/ui/widgets/user_details_bar.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
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
        child: Column(
          children: [
            const UserDetailsBar(
              offset: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMainButton(
                color: yellowColor,
                isLoading: false,
                child: const Text(
                  'Proceed to buy {n} items',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    product: ProductModel(
                      url: amazonLogoUrl,
                      productName: 'Robot X Space',
                      cost: 2000.999,
                      discount: 12,
                      uid: 'azeeedddeza&zzee',
                      sellerName: 'Tyga Prince of Space',
                      sellerUid: 'eeddddeeeaa',
                      rating: 1,
                      numOfRating: 23334,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
