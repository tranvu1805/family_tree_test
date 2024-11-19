import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:family_tree_test/repository/auth_repo/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthLoginSubmitted>(_onLoading);
    on<AuthCheckToken>(_onCheckToken);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }
  final AuthRepository _authRepository;
  FutureOr<void> _onLoading(
      AuthLoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final token = await _authRepository.logIn(
          username: event.email, password: event.password);
      if (token.isNotEmpty) {
        emit(AuthSuccess(token: token));
      } else {
        emit(const AuthFailure(error: 'Invalidate token'));
      }
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _onCheckToken(
      AuthCheckToken event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthSuccess(token: 'token'));
    // emit(AuthFailure(error: 'errr'));
    // emit(AuthInitial());
  }

  FutureOr<void> _onLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
