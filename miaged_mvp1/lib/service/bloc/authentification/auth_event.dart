part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthEvent {}

class AuthSignInRequested extends AuthEvent {}

class AuthSignUpRequested extends AuthEvent {}

class AuthSignOutRequested extends AuthEvent {}
