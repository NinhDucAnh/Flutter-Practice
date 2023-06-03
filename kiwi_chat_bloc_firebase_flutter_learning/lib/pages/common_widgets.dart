
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/values/colors.dart';

Widget buildTextField(String textType, void Function(String value)? func){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.w),
        child: Text(
          textType =="email"?'Email Address':'Password',
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      Container(
        height: 57.h,
        width: 350.w,
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.elementColor,
              width: 2.w
          ),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child:  TextField(
          autocorrect: false,
          obscureText: textType =="password"?true :false,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            border:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ],
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook"),
        ],
      ));
}
