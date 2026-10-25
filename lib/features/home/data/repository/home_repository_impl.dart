import 'package:otlob/features/home/data/data_source/home_remote_data_source.dart';
import 'package:otlob/features/home/domain/repository/home_repository_abs.dart';

class HomeRepositoryImpl implements HomeRepositoryAbs {
  // ignore: unused_field
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);
}
