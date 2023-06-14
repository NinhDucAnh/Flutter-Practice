import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/colors.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/home_page/user_tab/user_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
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
              const Icon(Icons.search, color:AppColors.secondaryColorText ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Chat',
                    hintStyle: GoogleFonts.poppins(
                      color: AppColors.secondaryColorText,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
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
              icon: const Icon(Icons.qr_code, color: AppColors.secondaryColorText),
              onPressed: () {
                // Add your settings logic here
              },
            ),
          ),
        ],
      ),
      body: DefaultTabController(length: 3,
        child:Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 70.h,
          child: Column(
            children: [
              TabBar(
                labelColor: AppColors.primarySecondaryBackground,
                unselectedLabelColor: AppColors.secondaryColorText,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.symmetric(horizontal:15.w,),
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
                tabs:const  [
                  Tab(text:'Chats',),
                  Tab(text:'Friends'),
                  Tab(text:'All Users'),
                ],
              ),
              Container(
                child: const Expanded(
                  child: TabBarView(children:[
                    Text('duc anh'),
                    Text('duc anh1'),
                    UserTab(),
                  ]),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}





