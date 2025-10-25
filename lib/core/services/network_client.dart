// lib/core/services/network_client.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../errors/app_exception.dart';

typedef Json = Map<String, dynamic>;

class NetworkClient {
  final String baseUrl;
  final Future<String?> Function() getToken;

  NetworkClient({
    required this.baseUrl,
    required this.getToken,
  });

  Uri _uri(String path, [Map<String, dynamic>? query]) {
    return Uri.parse('$baseUrl$path').replace(
      queryParameters: query?.map((k, v) => MapEntry(k, '$v')),
    );
  }

  Future<Json> get(String path, {Map<String, dynamic>? query}) async {
    final token = await getToken();
    final res = await http.get(_uri(path, query), headers: _headers(token));
    return _handle(res);
  }

  Future<Json> post(String path, {Object? body}) async {
    final token = await getToken();
    final res = await http.post(
      _uri(path),
      headers: _headers(token),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handle(res);
  }

  Future<Json> put(String path, {Object? body}) async {
    final token = await getToken();
    final res = await http.put(
      _uri(path),
      headers: _headers(token),
      body: body != null ? jsonEncode(body) : null,
    );
    return _handle(res);
  }

  Future<Json> delete(String path) async {
    final token = await getToken();
    final res = await http.delete(_uri(path), headers: _headers(token));
    return _handle(res);
  }

  Map<String, String> _headers(String? token) {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Json _handle(http.Response res) {
    final json = res.body.isNotEmpty
        ? jsonDecode(res.body) as Json
        : <String, dynamic>{};

    if (res.statusCode >= 200 && res.statusCode < 300) {
      return json;
    }

    throw NetworkException(
      json['message']?.toString() ?? 'Error en la petición',
      statusCode: res.statusCode,
      details: json,
    );
  }
}
