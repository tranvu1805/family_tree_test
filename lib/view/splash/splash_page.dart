import 'package:family_tree_test/repository/auth_repo/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../viewmodel/auth/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthRepository _authRepository;
  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: _authRepository)..add(AuthCheckToken()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/home');
          } else if (state is AuthFailure) {
            context.go('/login');
          } else if (state is AuthInitial) {
            context.go('/register');
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return const Center(child: Text('Welcome you to VietLac'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
