import 'package:amazon_clone/ui/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/ui/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              CategoriesHorizontalListViewBar(),
              BannerAdWidget(),
            ],
          ),
        ));
  }
}
