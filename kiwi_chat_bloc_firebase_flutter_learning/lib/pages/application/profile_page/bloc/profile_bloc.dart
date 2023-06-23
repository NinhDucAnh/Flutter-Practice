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

  void fetchCurrentUser() {
      FireBaseService.getCurrentUser().then((value){
          final name = value!.name;
          final image = value.image;
          final email = value.email;
          add(UpdateImage(image!));
          add(UpdateName(name!));
          add(UpdateEmail(email!));
      });
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