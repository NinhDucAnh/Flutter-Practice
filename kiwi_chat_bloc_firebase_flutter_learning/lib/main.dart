import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/home_page/home_page.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/sign_up.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/welcome/welcome.dart';

import 'pages/sign_in/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignInBloc>(create: (_) => SignInBloc()),
          BlocProvider<SignUpBloc>(create: (_) => SignUpBloc()),
        ],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {
                    '/': (context) => const Welcome(),
                    'sign_in': (context) => const SignIn(),
                    'sign_up': (context) => const SignUp(),
                    'home_page': (context) => const HomePage(),
                  },
                )));
  }
}
