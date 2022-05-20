import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_mvp1/data/models/user_model.dart';
import 'package:miaged_mvp1/data/repositories/authentication_repository.dart';
import 'package:miaged_mvp1/data/repositories/database_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository;
  final DatabaseRepository _databaseRepository;

  AuthBloc(this._authenticationRepository, this._databaseRepository)
      : super(AuthenticationInitial()) {
    on<AuthInitial>((event, emit) async {
      //UserModel user = await _authenticationRepository.getCurrentUser().first;
      final result = _authenticationRepository.isSignedIn();
      if (result) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailure());
      }
    });

    on<AuthSignInAnonRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await _authenticationRepository.signAsGuest();
        emit(AuthenticationSuccess());
      } catch (e) {
        emit(AuthenticationFailure());
      }
    });

    on<AuthSignInRequested>((event, emit) async {
      emit(AuthenticationLoading());
      UserModel userModel =
          UserModel(email: event.email, password: event.password);
      try {
        UserCredential? authUser =
            await _authenticationRepository.signIn(userModel);
        if (authUser!.user != null) {
          emit(AuthenticationSuccess());
        }
      } catch (e) {
        emit(AuthenticationFailure());
      }
    });

    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthenticationLoading());
      UserModel userModel =
          UserModel(email: event.email, password: event.password);
      try {
        UserCredential? authUser =
            await _authenticationRepository.signUp(userModel);
        if (authUser?.user != null) {
          emit(AuthenticationSuccess());
        } /*else {
          emit(const AuthInvalidLogin('invalid credential'));
        }*/
      } catch (e) {
        emit(AuthenticationFailure());
      }
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<AuthSignOutRequested>((event, emit) async {
      emit(AuthenticationLoading());
      await _authenticationRepository.signOut();
      emit(AuthenticationFailure());
    });
  }
}
