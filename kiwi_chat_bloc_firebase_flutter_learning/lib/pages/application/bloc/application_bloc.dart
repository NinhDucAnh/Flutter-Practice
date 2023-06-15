import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_event.dart';
import 'application_state.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc() : super(const AppState()){
    on<TriggerBottomNavEvent>(_handleBttmNavBar);
  }

   _handleBttmNavBar(TriggerBottomNavEvent event,Emitter emit){
    emit(state.copyWith(bttmNavBarIndex: event.bttmNavBarIndex));
   }

}