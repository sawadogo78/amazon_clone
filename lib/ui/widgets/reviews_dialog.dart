import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

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
      onSubmitted: (RatingDialogResponse response) {
        print(response.comment);
        print(response.rating);
      },
    );
  }
}
