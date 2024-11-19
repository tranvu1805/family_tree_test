part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;

  const AuthSuccess({required this.token});
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class AuthCheck extends AuthState {
  final bool isAuth;

  const AuthCheck({required this.isAuth});
}
