import 'package:otlob/features/home/data/api/api.dart';

abstract class HomeRemoteDataSource {}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  // ignore: unused_field
  final HomeApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);
}
