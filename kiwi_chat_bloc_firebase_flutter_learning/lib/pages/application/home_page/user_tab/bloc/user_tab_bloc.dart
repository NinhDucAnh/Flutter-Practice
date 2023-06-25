import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/home_page/user_tab/bloc/user_tab_event.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/home_page/user_tab/bloc/user_tab_state.dart';

class UserTabBloc extends Bloc<UserTabEvent, UserTabState>{
  UserTabBloc(): super(UserTabState()){
    on(_handleButtonClickedIcon);

  }

   _handleButtonClickedIcon(ButtonClickedEvent event, Emitter<UserTabState> emit) {
    emit(state.copyWith(event.iconData));
  }
}