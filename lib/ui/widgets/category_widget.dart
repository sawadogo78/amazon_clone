// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/ui/screens/results_screen.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/utils/constants.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  const CategoryWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ResultsScreeen(
                query: categoriesList[index],
              );
            },
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          children: [
            Image.network(categoryLogos[index]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoriesList[index],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
