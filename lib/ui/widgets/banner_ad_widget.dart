import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';

import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    final double smallAdHeight = screenSize.width / 5;

    return GestureDetector(
      onHorizontalDragEnd: (_) {
        setState(() {
          currentAd++;
          if (currentAd == (largeAds.length)) {
            currentAd = 0;
          }
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            height: smallAdHeight,
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsFromIndex(0, smallAdHeight),
                getSmallAdsFromIndex(1, smallAdHeight),
                getSmallAdsFromIndex(2, smallAdHeight),
                getSmallAdsFromIndex(3, smallAdHeight),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsFromIndex(int index, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height,
        width: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(smallAds[index]),
              const SizedBox(
                height: 5,
              ),
              Text(adItemNames[index]),
            ],
          ),
        ),
      ),
    );
  }
}
