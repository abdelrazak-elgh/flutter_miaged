import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_mvp1/data/data_providers/auth_repository.dart';

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
          emit(AuthUserConnectionInProgress(user));
        } else if (!isSignedIn) {
          emit(UnAuthenticated());
        } else {
          emit(const AuthError('Something wrong'));
        }
      },
    );

    on<AuthSignInAnonRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.signAsGuest();
        emit(AuthAnonConnectionInProgress(result!));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AuthSignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await authRepository.signIn(
          email: event.email,
          password: event.password,
        );
        if (result != null) {
          emit(AuthUserConnectionInProgress(result));
        } else {
          emit(const AuthInvalidLogin('invalid credential'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final credential = await authRepository.signUp(
            email: event.email, password: event.password);
        if (credential != null) {
          //emit(AuthSignUpSuccessfull);
          emit(AuthUserCreationInProgress(credential));
        } else {
          emit(const AuthInvalidLogin('invalid credential'));
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AuthUserRegistrationRequested>((event, emit) async {
      emit(AuthUserCreatePage());
    });

    on<AuthUserConnectionRequested>((event, emit) async {
      emit(AuthUserConnectPage());
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<AuthSignOutRequested>((event, emit) async {
      emit(AuthLoading());
      await authRepository.signOut();
      emit(AuthSignOutInProgress());
      //emit(UnAuthenticated());
    });
  }
}
