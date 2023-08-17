import 'package:flutter/material.dart';

class Utils {
  // using media query without the context to get the screen size (height and width)

  Size getScreenSize(MediaQueryData mediaQueryData) {
    return mediaQueryData.size;
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: Center(child: Text(content)),
      ),
    );
  }
}
