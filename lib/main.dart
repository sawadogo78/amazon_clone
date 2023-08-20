import 'package:amazon_clone/providers/user_details_provider.dart';
import 'package:amazon_clone/ui/screens/sell_screen.dart';
import 'package:amazon_clone/ui/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // For web
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCd0rGG9GRwOSTrd6PW--EM2M4xx7hhcjM",
          authDomain: "clone-8e8bd.firebaseapp.com",
          projectId: "clone-8e8bd",
          storageBucket: "clone-8e8bd.appspot.com",
          messagingSenderId: "784215241398",
          appId: "1:784215241398:web:3816af80465f258663ac17"),
    );
  }
  // For Android
  else {
    await Firebase.initializeApp();
  }
  runApp(
    const AmazonClone(),
  );
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserDetailsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'AMAZON CLONE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: backgroundColor),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (user.hasData) {
              // return const ScreenLayout();
              return const SellScreen();
            } else {
              return const SignInScreen();
            }
          },
        ),
      ),
    );
  }
}
