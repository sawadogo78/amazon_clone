import 'dart:typed_data';

import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/loading_widget.dart';
import 'package:amazon_clone/ui/widgets/text_field_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 4;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = Utils().getScreenSize(MediaQuery.of(context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: !isLoading
            ? SingleChildScrollView(
                child: SizedBox(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                image == null
                                    ? Image.network(
                                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                                        height: screenSize.height / 10,
                                      )
                                    : Image.memory(
                                        image!,
                                        height: screenSize.height / 10,
                                      ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () async {
                                      Uint8List? temp = await Utils()
                                          .pickImage(ImageSource.gallery);

                                      if (temp != null) {
                                        setState(() {
                                          image = temp;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.file_upload,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Container(
                                height: screenSize.height * 0.8,
                                width: screenSize.width * 0.7,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 50,
                                      ),
                                      child: TextFieldWidget(
                                        title: 'Name',
                                        hintText: 'Enter the item name',
                                        controller: nameController,
                                        obscureText: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 50,
                                      ),
                                      child: TextFieldWidget(
                                        title: 'Cost',
                                        hintText: 'Enter the item cost',
                                        controller: costController,
                                        obscureText: false,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 50,
                                      ),
                                      child: Text(
                                        "Discount",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: ListTile(
                                        title: const Text('None'),
                                        leading: Radio(
                                          value: 1,
                                          groupValue: selected,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selected = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: ListTile(
                                        title: const Text('70%'),
                                        leading: Radio(
                                          value: 2,
                                          groupValue: selected,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selected = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: ListTile(
                                        title: const Text('60%'),
                                        leading: Radio(
                                          value: 3,
                                          groupValue: selected,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selected = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                      ),
                                      child: ListTile(
                                        title: const Text('50%'),
                                        leading: Radio(
                                          value: 4,
                                          groupValue: selected,
                                          onChanged: (int? value) {
                                            setState(() {
                                              selected = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: CustomMainButton(
                                color: yellowColor,
                                isLoading: isLoading,
                                child: const Text(
                                  "Sell",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: CustomMainButton(
                                color: Colors.grey.shade300,
                                isLoading: isLoading,
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                child: LoadingWidget(),
              ),
      ),
    );
  }
}
