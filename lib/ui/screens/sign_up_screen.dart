// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:amazon_clone/ressources/authentication_methods.dart';
import 'package:amazon_clone/ui/screens/sign_in_screen.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/text_field_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    addresscontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = Utils().getScreenSize(mediaQueryData);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screenSize.height * 0.1,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.7,
                    // FittedBox change the child to fit it parent Widget, here the container will fit the box of sizedbox
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.8,
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sign-up',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFieldWidget(
                              title: 'Name',
                              hintText: 'Enter your name',
                              controller: namecontroller,
                              obscureText: false,
                            ),
                            TextFieldWidget(
                              title: 'Address',
                              hintText: 'Enter your name',
                              controller: addresscontroller,
                              obscureText: false,
                            ),
                            TextFieldWidget(
                              title: 'Email',
                              hintText: 'Enter your email',
                              controller: emailcontroller,
                              obscureText: false,
                            ),
                            TextFieldWidget(
                              title: 'Password',
                              hintText: 'Enter your password',
                              controller: passwordcontroller,
                              obscureText: true,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                color: yellowColor,
                                isLoading: false,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    letterSpacing: 0.7,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () async {
                                  final res =
                                      await authenticationMethods.signUpUser(
                                          name: namecontroller.text,
                                          address: addresscontroller.text,
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                  if (res == 'success') {
                                    //Function
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SignInScreen()));
                                  } else {
                                    // error feadback
                                    Utils().showSnackBar(
                                        context: context, content: res);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomMainButton(
                    color: Colors.grey[200]!,
                    isLoading: false,
                    child: Text(
                      'Back',
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignInScreen();
                      }));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
