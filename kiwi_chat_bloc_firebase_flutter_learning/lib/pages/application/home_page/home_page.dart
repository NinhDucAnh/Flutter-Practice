import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar       (
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70.h,
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 15.h),
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          decoration: BoxDecoration(
            color: AppColors.bgElementColor,
            borderRadius: BorderRadius.circular(14.w),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color:AppColors.secondaryColorText ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      color: AppColors.secondaryColorText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15.w,top: 10.h,bottom: 10.h),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: AppColors.bgElementColor,
              borderRadius: BorderRadius.circular(14.w),
            ),
            child: IconButton(
              icon: Icon(Icons.qr_code, color: AppColors.secondaryColorText),
              onPressed: () {
                // Add your settings logic here
              },
            ),
          ),
        ],
      ),
      body:Container(),
    );
  }
}





