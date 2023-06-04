import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/sign_up.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/welcome/welcome.dart';

import 'pages/sign_in/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) =>  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const Welcome(),
        'sign_in':(context) => const SignIn(),
        'sign_up':(context) => const SignUp(),
      },
    ));
  }
}

