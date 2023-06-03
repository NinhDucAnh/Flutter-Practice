import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/common_widgets.dart';

import '../../common/values/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(25.w),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 37.h,
                    width: 37.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.w),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Gap(30.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Welcome Back',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                        ),
                      ),
                      Text(
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        'Happy to see you again, to use your\naccount please login first.',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  Gap(35.h),
                  buildTextField('email', (value) {}),
                  Gap(20.h),
                  buildTextField('password', (value) {}),
                  Gap(15.h),
                  Container(
                    margin: EdgeInsets.only(left: 200.w),
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp),
                    ),
                  ),
                  Gap(35.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 334.w,
                      decoration: BoxDecoration(
                        color: AppColors.primarySecondaryBackground,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            color: AppColors.primaryColorText,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(35.h),
                  // divider text divider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
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
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
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
              Positioned(
                top: 110.h,
                right: 8,
                child: SizedBox(
                    height: 90.h,
                    width: 90.h,
                    child: Image.asset('assets/images/kiwi_sword.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
