import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

class UserTabState{
  final IconData iconData;
  UserTabState({this.iconData = EvaIcons.personAdd});

  UserTabState copyWith(IconData icon){
    return UserTabState(
      iconData: icon,
    );
  }
}