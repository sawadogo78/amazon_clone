import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ui/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/ui/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/ui/widgets/products_showcase_list_view.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/ui/widgets/simple_product_widget.dart';
import 'package:amazon_clone/ui/widgets/user_details_bar.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // to get the scroll position
  ScrollController scrollController = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        // Position du scroll
        offset = scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  const SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  const CategoriesHorizontalListViewBar(),
                  const BannerAdWidget(),
                  ProductsShowcaseListView(
                    title: 'Upto 70 % off',
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
                  ProductsShowcaseListView(
                    title: 'Upto 60 % off',
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
                  ProductsShowcaseListView(
                    title: 'Upto 50 % off',
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
                  ProductsShowcaseListView(
                    title: 'Explore',
                    children: categoryLogos
                        .map(
                          (url) => SimpleProductWidget(
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
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
            UserDetailsBar(
              offset: offset,
            )
          ],
        ));
  }
}
