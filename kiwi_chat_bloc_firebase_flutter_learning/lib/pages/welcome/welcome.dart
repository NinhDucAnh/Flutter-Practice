import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryBackground,
      statusBarBrightness: Brightness.light,
    ));
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: Container(
          margin: EdgeInsets.all(25.w),
          child: Column(
            children: [
              Text(
                "Get Closer To EveryOne",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w600
                ),
              ),
              Gap(10.h),
              Text(
                "Helps you contact everyone with just easy way",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              Gap(15.h),
              Image.asset('assets/images/kiwi.png'),
              Gap(70.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,'sign_in');
                },
                child: Container(
                  height: 46.h,
                  width: 295.w,
                  decoration: BoxDecoration(
                    color: AppColors.primarySecondaryBackground,
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: Center(
                    child: Text('Get Started', style: GoogleFonts.poppins(
                      color:AppColors.primaryColorText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
