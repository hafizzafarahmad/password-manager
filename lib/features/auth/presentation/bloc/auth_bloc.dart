
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final SharedPreferences sharedPreferences;
  AuthBloc({required this.sharedPreferences}) : super(AuthInitialized());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {

    if(event is AppStarted){

      await Future.delayed(const Duration(seconds: 2));

      //check to show intro screen
      bool? intro = sharedPreferences.getBool("intro");

      if(intro == true){
        yield NeedAuthenticated();
      } else {
        yield AuthIntro();
      }


    }

    if(event is IntroDone){
      await sharedPreferences.setBool("intro", true);

      yield NeedAuthenticated();
    }

    if(event is ScanFingerEvent){
      yield Authenticated();
    }

  }

}

