import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/values/colors.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/application_widget.dart';
import '../common_widgets.dart';
import 'bloc/application_bloc.dart';
import 'bloc/application_event.dart';
import 'bloc/application_state.dart';
import 'home_page/user_tab/user_tab.dart';
class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
  builder: (context, state) {
    return Scaffold(
      body: buildPage(state.bttmNavBarIndex),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.bgElementColor,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(18.h), topRight: Radius.circular(18.h)),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.1),
               spreadRadius: 1,
               blurRadius: 1,
             )
           ]
        ),
        child: BottomNavigationBar(
          currentIndex: state.bttmNavBarIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primarySecondaryBackground,
          unselectedItemColor: AppColors.secondaryColorText,
          elevation: 0,
          onTap: (value) => context.read<AppBloc>().add(TriggerBottomNavEvent(value)),
          items: [
            reusableBtmNavBarItem('home'),
            reusableBtmNavBarItem('profile'),
            reusableBtmNavBarItem('settings'),
          ],

        ),
      ),
    );
  },
);
  }
}





