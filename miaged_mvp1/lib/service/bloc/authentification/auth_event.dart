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
  const AuthSignInRequested(this.email, this.password);
}

class AuthSignUpRequested extends AuthEvent {}

class AuthSignOutRequested extends AuthEvent {}
