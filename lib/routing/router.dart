import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../ui/auth/auth_view.dart';
import '../ui/auth/auth_view_model.dart';
import 'routes.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: kDebugMode,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) => AuthView(viewModel: AuthViewModel(authRepository: context.read())),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return AuthView(viewModel: AuthViewModel(authRepository: context.read()));
        // final viewModel = HomeViewModel();
        // viewModel.load.execute();
        // return HomePage(viewModel: viewModel);
      },
      routes: [
        GoRoute(
          path: IntRoutes.settings,
          builder: (context, state) {
            return AuthView(viewModel: AuthViewModel(authRepository: context.read()));
            // final viewModel = ImageWordViewModel();
            // viewModel.load.execute();
            // return ImageWordView(viewModel: viewModel);
          },
        ),
      ],
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  // if the user is not logged in, they need to login
  final loggedIn = context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  if (!loggedIn) {
    return Routes.login;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return Routes.home;
  }

  // no need to redirect at all
  return null;
}
