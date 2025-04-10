import 'package:flutter/material.dart';

class ToastHelper {
  static final ToastHelper _instance = ToastHelper._();
  static ToastHelper get instance => _instance;

  ToastHelper._();

  factory ToastHelper() => instance;

  final GlobalKey<ScaffoldMessengerState> _key = GlobalKey();
  GlobalKey<ScaffoldMessengerState> get key => _key;

  void hide() {
    _key.currentState?.hideCurrentSnackBar();
  }

  void show(SnackBar snackBar) {
    _key.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void success(String text, [SnackBarAction? action]) {
    show(
      SnackBar(
        content: Text(text, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        action: action ?? SnackBarAction(label: 'X', onPressed: hide),
      ),
    );
  }

  void error(String text, [SnackBarAction? action]) {
    show(
      SnackBar(
        content: Text(text, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        action: action ?? SnackBarAction(label: 'X', onPressed: hide),
      ),
    );
  }

  void info(String text, [SnackBarAction? action]) {
    show(
      SnackBar(
        content: Text(text, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        action: action ?? SnackBarAction(label: 'X', onPressed: hide),
      ),
    );
  }
}
