import 'package:dio/dio.dart';
import 'package:extension_type_with_bloc/product/constants/app_constants.dart';

final class NetworkManager {
  static final Dio _networkManager = Dio(
    BaseOptions(baseUrl: AppConstants.baseUrl),
  );

  static Dio get networkManager => _networkManager;
}
