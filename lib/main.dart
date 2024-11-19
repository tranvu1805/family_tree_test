import 'package:family_tree_test/repository/graph_repo/graph_repository.dart';
import 'package:family_tree_test/view/app/app_page.dart';
import 'package:family_tree_test/view/graph/graph_widget.dart';
import 'package:family_tree_test/view/login/login_page.dart';
import 'package:family_tree_test/view/register/register_page.dart';
import 'package:family_tree_test/view/splash/splash_page.dart';
import 'package:family_tree_test/viewmodel/graph/bloc/graph_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphview/GraphView.dart';

void main() => runApp(const MyApp());

final _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(path: '/', builder: (context, state) => const App()),
  GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  GoRoute(path: '/register', builder: (context, state) => const RegisterPage()),
  GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  GoRoute(path: '/graph', builder: (context, state) => GraphPage()),
]);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashPage());
  }
}

class GraphPage extends StatelessWidget {
  GraphPage({super.key});

  final BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GraphBloc(graphRepository: GraphRepository())..add(GraphFetched()),
      child: Scaffold(body: GraphWidget()),
    );
  }
}
