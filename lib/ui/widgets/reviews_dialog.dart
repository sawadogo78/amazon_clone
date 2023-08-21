// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/models/reviews_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/ressources/cloud_firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({
    Key? key,
    required this.productUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: const Text(
        'Give review for this product ',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?,
      submitButtonText: 'Send',
      commentHint: 'Type here your comment',
      onSubmitted: (RatingDialogResponse response) async {
        await CloudFireStoreClass().uploadReviewToDatabase(
          productUid: productUid,
          reviewModel: ReviewModel(
            senderName: Provider.of<UserDetailsProvider>(
              context,
              listen: false,
            ).userDetailsModel.name,
            description: response.comment,
            rating: response.rating.toInt(),
          ),
        );
      },
    );
  }
}
