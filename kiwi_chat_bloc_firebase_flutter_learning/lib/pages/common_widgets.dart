import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/values/colors.dart';

Widget buildTextField(String textType,String title, void Function(String value)? func) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.w),
        child: Text(
          title,
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
        child: TextField(
          onChanged: (value) {
            func!(value);
          },
          autocorrect: false,
          obscureText: textType == "password" ? true : false,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
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
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
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

Widget reusableButton(void Function() func, String title,) {
  return InkWell(
    onTap: func,
    child: Container(
      height: 40.h,
      width: 334.w,
      decoration: BoxDecoration(
        color: title == "Sign In"
            ? AppColors.primarySecondaryBackground
            : AppColors.secondaryElementColor,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: AppColors.primaryColorText,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}
