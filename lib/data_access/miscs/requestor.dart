part of data_access;

final _baseUri = Uri(scheme: 'https', host: 'HOST', path: 'PATH');

class Requestor {
  final BaseClient _client;

  Requestor() : _client = HttpClientWithInterceptor.build(interceptors: []);

  Uri _buildUrl(String path, {Map<String, String>? parameters}) {
    return Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      path: '${_baseUri.path}/$path',
      queryParameters: parameters,
    );
  }

  Future<T> performGet<T>(
    String path, {
    required Map<String, String> parameters,
  }) =>
      _client
          .get(_buildUrl(path, parameters: parameters))
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  Future<T> performPost<T>(
    String path, {
    required Map body,
  }) =>
      _client
          .post(
            _buildUrl(path),
            body: jsonEncode(body),
          )
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  Future<T> performPut<T>(
    String path, {
    required Map body,
  }) =>
      _client
          .put(
            _buildUrl(path),
            body: jsonEncode(body),
          )
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  T _extractResponse<T>(Response response) {
    if (response.statusCode == 401) {
      throw UnauthorizedAppException();
    }
    final responseBody = response.body;
    if (responseBody.isEmpty) {
      throw Exception('The response is empty');
    }
    final json = jsonDecode(responseBody);
    if (json is! Map) {
      throw AppException(
          internalMessage:
              'Invalid response format: Map was expected, but ${json.runtimeType} was received');
    } else if (!json.containsKey('data')) {
      throw AppException(
          internalMessage: 'Invalid response format: data key is not present');
    } else if (response.statusCode != 200) {
      dynamic message = json['data']['message'];
      if (message == null) {
        throw AppException(internalMessage: 'Unknown server error');
      } else {
        throw AppException(internalMessage: message.toString());
      }
    }
    return json['data'] as T;
  }

  _handleError(dynamic exception) {
    if (exception is SocketException && exception.osError!.errorCode == 7) {
      throw AppException(
          internalMessage: exception.message,
          userFriendlyMessage: 'error.serverUnreachable');
    } else {
      throw exception;
    }
  }
}
