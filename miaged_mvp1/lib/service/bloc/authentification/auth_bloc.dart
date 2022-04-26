import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<AuthInitial>(
      (event, emit) async {
        final isSignedIn = authRepository.isSignedIn();
        if (isSignedIn) {
          final user = authRepository.getUser();
          emit(AuthInProgress(user));
        } else if (!isSignedIn) {
          emit(AuthSignOutInProgress());
        } else {
          emit(const AuthError('Something wrong'));
        }
      },
    );

    on<AuthSignInAnonRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.signAsGuest();
        emit(AuthAnonInProgress(result!));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthSignOutInProgress());
      }
    });

    on<AuthSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.signIn(
            email: event.email,
            password: event.password,
            context: event.context);
        if (result != null) {
          emit(AuthInProgress(result));
        } else {
          emit(const AuthInvalidLogin('invalid credential'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthSignOutInProgress());
      }
    });

    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final credential = await authRepository.signUp(
            email: event.email, password: event.password);
        if (credential != null) {
          emit(AuthInProgress(credential));
        } else {
          emit(const AuthInvalidLogin('invalid credential'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthSignOutInProgress());
      }
    });

    on<AuthUserWantedRegister>((event, emit) async {
      emit(AuthUserCreateInProgress());
    });

    on<AuthUserWantedConnect>((event, emit) async {
      emit(AuthUserConnectInProgress());
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the AuthSignOutInProgress State
    on<AuthSignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(AuthSignOutInProgress());
    });
  }
}
