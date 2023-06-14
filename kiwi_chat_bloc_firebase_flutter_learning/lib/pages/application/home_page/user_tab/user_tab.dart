import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/service/FirebaseHelper.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/colors.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/firebase_key.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/common_widgets.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireBaseService.getListUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
            color: AppColors.primarySecondaryBackground,
          ));
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else if (snapshot.hasData) {
          List<UserChat> users = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (context, index) => itemListUser(users[index]),
          );
        } else {
          return const Center(child: Text('No users found'));
        }
      },
    );
  }

}
