import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_state.dart';

import '../../../common/values/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(25.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 120.w,
                                  height: 120.h,
                                  child: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/profile.jpg'),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 80.h,
                                  left: 175.w,
                                  child: const InkWell(
                                      child: Icon(
                                          Icons.upload, color: Colors.grey)
                                  )
                              ),
                            ],
                          ),
                          Gap(10.h),
                          Center(
                            child: Text(state.name, style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),),
                          ),
                          Center(
                            child: Text(state.email,
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),),
                          ),
                          Gap(10.h),
                          Text('Friends', style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}
