part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthEvent {}

class AuthSignInAnonRequested extends AuthEvent {}

class AuthSignInRequested extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;
  const AuthSignInRequested(this.email, this.password, this.context);
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthSignUpRequested(this.email, this.password);
}

class AuthUserWantedRegister extends AuthEvent {}

class AuthUserWantedConnect extends AuthEvent {}

class AuthSignOutRequested extends AuthEvent {}
