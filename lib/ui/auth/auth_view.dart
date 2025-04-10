import 'package:flutter/material.dart';

import 'auth_view_model.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key, required this.viewModel});

  final AuthViewModel viewModel;

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
