import 'package:flutter_clean_example_core/common/app_env.dart';
import 'package:flutter_clean_example_core/network/provider/dio_base_provider.dart';

//nếu không truyền tham số sẽ ăn theo cấu hình chung
class DioProviderImpl extends DioBaseProvider {
  DioProviderImpl({String? url, String? apiPrefix, String? apiVersion})
      : super(
            url: url ?? AppEnvironment.baseUrl,
            apiPrefix: apiPrefix ?? '',
            apiVersion: apiVersion ?? AppEnvironment.apiVersion);
}
