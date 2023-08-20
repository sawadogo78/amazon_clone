// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({
    Key? key,
    required this.color,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "\$",
          style: TextStyle(
            fontSize: 10,
            fontFeatures: [
              FontFeature.superscripts(),
            ],
          ),
        ),
        Text(
          cost.toInt().toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          (cost - cost.toInt()).toStringAsFixed(2),
          style: const TextStyle(
            fontSize: 10,
            fontFeatures: [
              FontFeature.superscripts(),
            ],
          ),
        )
      ],
    );
  }
}
