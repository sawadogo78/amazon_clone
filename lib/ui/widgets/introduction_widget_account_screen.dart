import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDetailsProvider>(context);
    final UserDetailsModel userDetails = userProvider.userDetailsModel;
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.000000001),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello , ',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      // ignore: unnecessary_string_interpolations
                      text: '${userDetails.name}',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'data:image/jpeg;base64,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',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
