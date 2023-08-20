// login exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {
  final bool success;
  final String message;

  EmailAlreadyInUseAuthException(
      {required this.success, required this.message});

  factory EmailAlreadyInUseAuthException.fromJson(error) {
    return EmailAlreadyInUseAuthException(
      success: error["success"],
      message: error["error"]["email"]["msg"],
    );
  }
}

class InvalidEmailAuthException implements Exception {}

// generic exceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
