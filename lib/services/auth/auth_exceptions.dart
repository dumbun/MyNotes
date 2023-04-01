// login exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exception

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailEnteryAuthException implements Exception {}

// generic exceptions

class GeniricAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
