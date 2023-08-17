// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/ui/screens/search_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSize {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({
    Key? key,
    required this.isReadOnly,
    required this.hasBackButton,
  })  : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                )
              : Container(),
          SizedBox(
            width: Utils().getScreenSize(MediaQuery.of(context)).width * 0.7,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                )
              ]),
              child: TextField(
                readOnly: isReadOnly,
                onTap: () {
                  if (isReadOnly) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchScreen();
                      },
                    ));
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search for something in amazon',
                  fillColor: Colors.white,
                  filled: true,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_none_outlined),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
