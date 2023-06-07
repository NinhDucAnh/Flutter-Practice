import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/service/FirebaseHelper.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/common_widgets.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController(this.context);

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    if (userName.isEmpty) {
      toastInfo(msg: "Username can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      if (user != null) {
        print("created user");
        await user.sendEmailVerification();
        await user.updateDisplayName(userName);
        toastInfo(
            msg: "An email has been sent to your registered email."
                " To active it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-user') {
        toastInfo(msg: 'The email is already in user');
      } else if (e.code == 'invalid-password') {
        toastInfo(msg: 'Your email id is invalid');
      }
    }
  }
}
