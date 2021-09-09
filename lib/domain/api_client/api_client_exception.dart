enum ApiClientExceptionType { network, auth, other, sessionExpired }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}
