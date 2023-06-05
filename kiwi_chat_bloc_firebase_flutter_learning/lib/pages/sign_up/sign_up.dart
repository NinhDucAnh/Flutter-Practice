import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_event.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_state.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/controller/sign_up_controller.dart';

import '../../common/values/colors.dart';
import '../common_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColors.primaryBackground,
            body: Container(
              width: double.infinity,
              margin: EdgeInsets.all(25.w),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(40.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to Kiwi Chat',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 24.sp,
                              ),
                            ),
                            Text(
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              "Sign in now and connect with\nothers. Let's chat!",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        Gap(35.h),
                        buildTextField('userName', "Username", (value) {
                          context.read<SignUpBloc>().add(UserNameEvent(value));
                        }),
                        Gap(20.h),
                        buildTextField('email', "Email Address", (value) {
                          context.read<SignUpBloc>().add(EmailAddressEvent(value));
                        }),
                        Gap(20.h),
                        buildTextField('password', "Password", (value) {
                          context.read<SignUpBloc>().add(PasswordEvent(value));
                        }),
                        Gap(15.h),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'sign_in');
                          },
                          child: InkWell(
                            onTap: (){Navigator.of(context).pop();},
                            child: Container(
                              margin: EdgeInsets.only(left: 85.w),
                              child: Text(
                                'Already have account, Login now',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp),
                              ),
                            ),
                          ),
                        ),
                        Gap(10.h),
                        reusableButton(() {
                          SignUpController(context).handleSignUp();
                        }, "Sign Up"),
                        Gap(10.h),
                        // divider text divider
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 15.0),
                                  child: const Divider(
                                    color: Colors.grey,
                                    height: 10,
                                  )),
                            ),
                            Text('Or Login with',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 15.0),
                                  child: const Divider(
                                    color: Colors.grey,
                                    height: 10,
                                  )),
                            ),
                          ],
                        ),
                        buildThirdPartyLogin(context),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 85.h,
                    right: 8,
                    child: SizedBox(
                        height: 85.h,
                        width: 85.h,
                        child: Image.asset('assets/images/kiwi_hold.png')),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
