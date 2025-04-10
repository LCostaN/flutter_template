import 'package:flutter/foundation.dart';
import '../../../ui/core/utils/command/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns true when the user is logged in
  bool get isAuthenticated;

  /// Perform register
  Future<Result<void>> register({required String email, required String password});

  /// Perform login
  Future<Result<void>> login({required String email, required String password});

  /// Perform logout
  Future<Result<void>> logout();
}
