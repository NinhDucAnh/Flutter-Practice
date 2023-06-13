import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/common_widgets.dart';

import '../../../common/enities/modal/user.dart';
import '../../../common/service/FirebaseHelper.dart';
import '../bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          print('try1');
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailAddress, password: password);
          print('try2');
          final user = credential.user;
          if (user == null) {
            print("dont exist");
            toastInfo(msg: "You don't exist");
            return;
          }
          // if (!user.emailVerified) {
          //   toastInfo(msg: "You need to verify your email account");
          //   return;
          // }
          if (user != null) {
            final userChat = UserChat(userId: user.uid, name: user.displayName, email: user.email,friends: [], image:"");
            FireBaseService.addUserToFireStore(userChat);
            Navigator.of(context).pushNamedAndRemoveUntil('home_page', (route) => false);
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
