import 'package:amazon_clone/ui/widgets/category_widget.dart';
import 'package:amazon_clone/ui/widgets/search_bar_widget.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              childAspectRatio: 2.2 / 3.5,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return CategoryWidget(index: index);
            },
          ),
        ));
  }
}
