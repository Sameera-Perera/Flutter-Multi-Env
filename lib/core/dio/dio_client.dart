import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../env/env_client.dart';

class DioClient {
  final Dio _dio = Dio();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  DioClient() {
    _dio.options.baseUrl = EnvClient.baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _secureStorage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshed = await _refreshToken();
          if (refreshed) {
            final token = await _secureStorage.read(key: 'access_token');
            // Retry original request with new token
            final opts = error.requestOptions;
            opts.headers['Authorization'] = 'Bearer $token';
            final cloneReq = await _dio.fetch(opts);
            return handler.resolve(cloneReq);
          }
        }
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;

  Future<bool> _refreshToken() async {
    final refreshToken = await _secureStorage.read(key: 'refresh_token');
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      final newToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await _secureStorage.write(key: 'access_token', value: newToken);
      await _secureStorage.write(key: 'refresh_token', value: newRefreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }
}
