import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/authentication_service.dart';



enum AuthenticationEvent { login, logout }

enum AuthenticationStatus { initial, authenticated, authenticationError, loading }

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationStatus> {
  final AuthenticationService _authenticationService;
  String email = "";
  String password = "";
  AuthenticationBloc(this._authenticationService) : super(AuthenticationStatus.initial) {
    on<AuthenticationEvent>((event, emit) async {
      switch (event) {
        case AuthenticationEvent.login:
          emit(AuthenticationStatus.loading);
          bool result = await _authenticationService.authenticate(email, password);
          if (result) {
            emit(AuthenticationStatus.authenticated);
          } else {
            emit(AuthenticationStatus.authenticationError);
          }
          break;
        case AuthenticationEvent.logout:
          emit(AuthenticationStatus.initial);
          break;
      }
    });
  }

  void triggerLogin(String email, String password) {
    this.email = email;
    this.password = password;
    add(AuthenticationEvent.login);
  }
  void register(String email, String password) async {
    bool registered = await _authenticationService.register(email, password);
    if (registered) {
      emit(AuthenticationStatus.authenticated);
    } else {
      emit(AuthenticationStatus.authenticationError);
    }
  }
}

