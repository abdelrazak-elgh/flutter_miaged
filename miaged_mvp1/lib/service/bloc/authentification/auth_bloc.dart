import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_mvp1/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthenticationInitial()) {
    on<AuthInitial>(
      (event, emit) async {
        final isSignedIn = authRepository.isSignedIn();
        if (isSignedIn) {
          final user = authRepository.getUser();
          emit(Authenticated(user));
        } else if (!isSignedIn) {
          emit(UnAuthenticated());
        } else {
          emit(const AuthError('Something wrong'));
        }
      },
    );

    on<AuthSignInAnonRequested>((event, emit) async {
      emit(AuthenticateLoading());
      try {
        User? result = await authRepository.signInAnon();
        emit(Authenticated(result!));
        // await Future.delayed(const Duration(seconds: 5), () {
        // });
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AuthSignInRequested>((event, emit) async {
      emit(AuthenticateLoading());
      try {
        User? result = await authRepository.signInWithCredentials(
            event.email, event.password);
        emit(Authenticated(result!));
        // await Future.delayed(const Duration(seconds: 5), () {
        // });
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<AuthSignOutRequested>((event, emit) async {
      emit(AuthenticateLoading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
