abstract class Validator {
  static const requiredError = 'Campo obrigatório';
  static const minimumLength4 = 'Nome deve ter ao menos 4 caracteres';
  static const emailInvalidError = 'E-mail inválido';
  static const passwordMinLengthError = 'Senha deve ter no mínimo 6 caracteres';

  static String? required(String? input) {
    if ((input ?? '').isEmpty) return requiredError;
    return null;
  }

  static String? name(String? input, [bool required = true]) {
    input ??= '';

    if (required && input.isEmpty) {
      return requiredError;
    }

    return null;
  }

  static String? email(String? input, [bool required = true]) {
    input ??= '';

    if (required && input.isEmpty) {
      return requiredError;
    }

    if (!input.contains('@')) return emailInvalidError;

    return null;
  }

  static String? password(String? input, [bool required = true]) {
    input ??= '';

    if (required && input.isEmpty) {
      return requiredError;
    }

    if (input.length < 6) {
      return passwordMinLengthError;
    }

    return null;
  }
}
