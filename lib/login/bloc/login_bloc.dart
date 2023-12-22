import 'package:goodspacelogin/login/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodspacelogin/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on((event, emit) => null);
  }
}
