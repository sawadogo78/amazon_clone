// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:amazon_clone/ressources/authentication_methods.dart';
import 'package:amazon_clone/ui/screens/sign_up_screen.dart';
import 'package:amazon_clone/ui/widgets/custom_main_button.dart';
import 'package:amazon_clone/ui/widgets/text_field_widget.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final AuthenticationMethods _authenticationMethods = AuthenticationMethods();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
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
          height: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.network(
                      amazonLogo,
                      height: screenSize.height * 0.1,
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.6,
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
                          'Sign-in',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
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
                            isLoading: isLoading,
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                letterSpacing: 0.7,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              String res =
                                  await _authenticationMethods.signInUser(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text);
                              setState(() {
                                isLoading = false;
                              });
                              if (res == 'success') {
                              } else {
                                Utils().showSnackBar(
                                    context: context, content: res);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'New to Amazon ?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomMainButton(
                    color: Colors.grey[200]!,
                    isLoading: false,
                    child: Text(
                      'Create an Amazon Account',
                      style: TextStyle(
                        letterSpacing: 0.6,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
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
