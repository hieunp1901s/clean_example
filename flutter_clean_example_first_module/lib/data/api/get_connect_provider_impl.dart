import 'package:flutter_clean_example_core/common/app_env.dart';
import 'package:flutter_clean_example_core/main.dart';

//nếu không truyền tham số sẽ ăn theo cấu hình chung
class GetConnectProviderImpl extends GetConnectBaseProvider {
  GetConnectProviderImpl({String? url, String? apiPrefix, String? apiVersion})
      : super(
            url: url ?? AppEnvironment.baseUrl,
            apiPrefix: apiPrefix ?? '',
            apiVersion: apiVersion ?? AppEnvironment.apiVersion);
}
