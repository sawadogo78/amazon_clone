import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:amazon_clone/ui/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/ui/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/ui/widgets/loading_widget.dart';
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
  List<ProductModel>? discount70;
  List<ProductModel>? discount60;
  List<ProductModel>? discount50;
  List<ProductModel>? discount0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        // Position du scroll
        offset = scrollController.position.pixels;
      });
    });
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void getData() async {
    List<ProductModel> temp70 =
        await CloudFireStoreClass().getProductsFromDiscount(discount: 70);
    List<ProductModel> temp60 =
        await CloudFireStoreClass().getProductsFromDiscount(discount: 60);
    List<ProductModel> temp50 =
        await CloudFireStoreClass().getProductsFromDiscount(discount: 60);
    List<ProductModel> temp0 =
        await CloudFireStoreClass().getProductsFromDiscount(discount: 60);

    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                UserDetailsBar(
                  offset: offset,
                ),
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
                        children: discount70!
                            .map((product) =>
                                SimpleProductWidget(productModel: product))
                            .toList(),
                      ),
                      ProductsShowcaseListView(
                        title: 'Upto 60 % off',
                        children: discount60!
                            .map(
                              (product) => SimpleProductWidget(
                                productModel: product,
                              ),
                            )
                            .toList(),
                      ),
                      ProductsShowcaseListView(
                        title: 'Upto 50 % off',
                        children: discount50!
                            .map(
                              (product) => SimpleProductWidget(
                                productModel: product,
                              ),
                            )
                            .toList(),
                      ),
                      ProductsShowcaseListView(
                        title: 'Explore',
                        children: discount0!
                            .map(
                              (product) => SimpleProductWidget(
                                productModel: product,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
