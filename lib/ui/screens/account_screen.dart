import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/screens/sell_screen.dart';
import 'package:amazon_clone/ui/widgets/account_screen_app_bar.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/introduction_widget_account_screen.dart';
import 'package:amazon_clone/ui/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/ui/widgets/simple_product_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              const IntroductionWidgetAccountScreen(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                  color: Colors.orange,
                  isLoading: false,
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                  color: yellowColor,
                  isLoading: false,
                  child: const Text(
                    'Sell',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SellScreen();
                      },
                    ));
                  },
                ),
              ),
              ProductsShowcaseListView(
                title: 'Your orders',
                children: categoryLogos
                    .map((url) => SimpleProductWidget(
                          productModel: ProductModel(
                            url: url,
                            productName: 'Robot X Space',
                            cost: 200000.999,
                            discount: 0,
                            uid: 'aaa',
                            sellerName: 'Tyga Prince of Space',
                            sellerUid: 'dddaad',
                            rating: 2,
                            numOfRating: 7,
                          ),
                        ))
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order requests',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: const Text(
                        'Order: Black Shoes',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: const Text('Address :  18 Rue Space'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.check),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
