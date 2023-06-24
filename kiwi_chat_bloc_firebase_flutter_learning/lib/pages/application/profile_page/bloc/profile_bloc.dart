import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/enities/modal/user.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/common/service/FirebaseHelper.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_event.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/application/profile_page/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
    ProfileBloc():super(ProfileState()){
      fetchCurrentUser();
      on(_handleUpdateImage);
      on(_handleUpdateName);
      on(_handleUpdateEmail);
    }

  Future<void> fetchCurrentUser() async {
    UserChat? user = await FireBaseService.getCurrentUser();
    print('User: ${user.toString()}');
    add(UpdateEmail(user!.email!));
    add(UpdateName(user.name!));
    add(UpdateImage(user.image!));

  }

  FutureOr<void> _handleUpdateImage(UpdateImage event, Emitter<ProfileState> emit) {
      emit(state.copyWith(image: event.imagePath));
  }

  FutureOr<void> _handleUpdateName(UpdateName event, Emitter<ProfileState> emit) {
      emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _handleUpdateEmail(UpdateEmail event, Emitter<ProfileState> emit) {
      emit(state.copyWith(email: event.email));
  }
}