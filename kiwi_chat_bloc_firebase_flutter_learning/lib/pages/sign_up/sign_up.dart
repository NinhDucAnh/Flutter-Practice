import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(25.w),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 37.h,
                        width: 37.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.w),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Gap(30.h),
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
                    buildTextField('email', (value) {}),
                    Gap(20.h),
                    buildTextField('password', (value) {}),
                    Gap(15.h),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, 'sign_in');
                      },
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
                    Gap(35.h),
                    reusableButton(() {}, "Sign Up"),
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
                Positioned(
                  top: 110.h,
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
      ),
    );
  }
}
