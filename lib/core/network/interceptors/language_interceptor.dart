import 'package:dio/dio.dart';


class LanguageInterceptor extends Interceptor {
  LanguageInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final language = SCAFFOLD_MESSENGER_KEY.currentContext!.locale
    //     .toLanguageTag();
    // options.headers['Accept-Language'] = language;
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
