class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

// Internet Exception Function...
class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet');
}

//Request Time Out Exception Function...
class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Time out');
}

//Internal Server Exception Function...
class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, 'Internal server error');
}

//InvalidUrl Exception Function...
class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

//Data Fetching Exception Function...
class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '');
}