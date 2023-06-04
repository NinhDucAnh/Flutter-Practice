import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_in_event.dart';
import 'package:kiwi_chat_bloc_firebase_flutter_learning/pages/sign_up/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc() : super(const SignInState()){
    on<EmailEvent>(_emailHandler);
  }

  void _emailHandler(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email : event.email));
  }

  void _passwordHandler(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password : event.password));
  }


}