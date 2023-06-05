import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_event.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  SignUpBloc() : super(const SignUpState()){
   on<UserNameEvent>(_userNameHandler);
   on<EmailAddressEvent>(_emailHandler);
   on<PasswordEvent>(_passwordHandler);
  }


  void _userNameHandler(UserNameEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(userName: event.userName));
  }
  void _emailHandler( EmailAddressEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordHandler(PasswordEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(password: event.password));
  }


}