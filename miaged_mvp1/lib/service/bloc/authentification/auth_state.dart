part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthState {}

class AuthenticationLoading extends AuthState {}

class AuthenticationSuccess extends AuthState {}

class AuthenticationFailure extends AuthState {}
