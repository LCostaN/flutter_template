import '../../data/repositories/auth/auth_repository.dart';
import '../core/utils/command/command.dart';
import '../core/utils/command/result.dart';

class AuthViewModel {
  AuthViewModel({required AuthRepository authRepository}) : _authRepository = authRepository {
    login = Command1<void, (String email, String password)>(_login);
    register = Command1<void, (String email, String password)>(_register);
  }

  final AuthRepository _authRepository;

  late Command1<void, (String, String)> login;
  late Command1<void, (String, String)> register;

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _authRepository.login(email: email, password: password);

    switch (result) {
      case Ok<void>():
        return Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _register((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _authRepository.register(email: email, password: password);

    switch (result) {
      case Ok<void>():
        return Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
