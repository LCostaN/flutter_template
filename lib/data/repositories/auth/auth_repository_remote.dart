import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

import '../../../ui/core/utils/command/result.dart';

import 'auth_repository.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote();

  final _auth = FirebaseAuth.instance;
  final _log = Logger('AuthRepositoryRemote');

  @override
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  Future<Result<void>> login({required String email, required String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      if (user == null) {
        _log.info('Could not log user in');
        return Result.error(Exception('Invalid credentials'));
      }

      _log.info('User logged in');
      return Result.ok(null);
    } catch (e) {
      _log.warning(e);
      return Result.error(Exception('Invalid credentials'));
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> register({required String email, required String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = result.user;
      if (user == null) {
        _log.info('Could not create user');
        return Result.error(Exception('User creation failed'));
      }

      _log.info('User created and logged');
      return Result.ok(null);
    } catch (e) {
      _log.warning(e);
      return Result.error(Exception('Could not create user'));
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _auth.signOut();
      _log.info('User logged out');
      return Result.ok(null);
    } catch (e) {
      _log.warning(e);
      return Result.error(Exception('Logout failed'));
    } finally {
      notifyListeners();
    }
  }
}
