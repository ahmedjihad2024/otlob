import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _HomeApiService;
}