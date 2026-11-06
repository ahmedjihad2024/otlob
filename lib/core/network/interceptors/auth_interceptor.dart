import 'package:dio/dio.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storageService;

  AuthInterceptor(this._storageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.path.toLowerCase();
    // Do not attach authorization header to authentication endpoints
    final isAuthEndpoint =
        path.contains('/account/login') || path.contains('/account/register');

    if (!isAuthEndpoint) {
      final token = await _storageService.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
