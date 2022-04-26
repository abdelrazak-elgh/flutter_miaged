part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignOutInProgress extends AuthState {}

class AuthUserCreateInProgress extends AuthState {}

class AuthUserConnectInProgress extends AuthState {}

class AuthInProgress extends AuthState {
  final User user;
  const AuthInProgress(this.user);

  @override
  List<Object> get props => [user];
}

class AuthAnonInProgress extends AuthState {
  final User user;
  const AuthAnonInProgress(this.user);

  @override
  List<Object> get props => [user];
}

class AuthInvalidLogin extends AuthState {
  final String credentialError;

  const AuthInvalidLogin(this.credentialError);

  @override
  List<Object> get props => [credentialError];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String authError;

  const AuthError(this.authError);

  @override
  List<Object> get props => [authError];
}
