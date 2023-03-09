import 'package:flutter_clean_example_first_module/core/config/first_module_api_route.dart';
import 'package:flutter_clean_example_first_module/data/api/dio_provider_impl.dart';
import 'package:flutter_clean_example_first_module/data/api/get_connect_provider_impl.dart';
import 'package:flutter_clean_example_first_module/data/api/request/login_request.dart';
import 'package:flutter_clean_example_first_module/data/api/response/login_response.dart';
import 'package:flutter_clean_example_first_module/domain/repository/login_repository.dart';
import '../api/response/change_password_response.dart';

class LoginRepositoryImpl implements LoginRepository {
  final dioProvider = DioProviderImpl();
  final getConnectProvider = GetConnectProviderImpl();

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await getConnectProvider.get(FirstModuleApiRoute.login, query: {'q': 'Laptop'});
    // final response = await getConnectProvider.post(FirstModuleApiRoute.login, request.toRequest());
    // nếu không cần body trả về thì chỗ này truyền hàm tạo của BaseResponse
    //return getConnectProvider.convertResponse(response, (json) => BaseResponse());
    return getConnectProvider.convertResponse(response, (json) => LoginResponse.fromJson(json));
  }

  @override
  Future<ChangePasswordResponse> changePassword() async {
    final response = await dioProvider.get(FirstModuleApiRoute.changePassword);
    return dioProvider.convertResponse(response, (json) => ChangePasswordResponse.fromJson(json));
  }
}

// có thể extends lại impl gốc để sửa đổi 1 vài chi tiết
// ở case dưới chỉ có login thay đổi nên chỉ override lại login
class LoginRepositoryImplV2 extends LoginRepositoryImpl {
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await getConnectProvider.get(FirstModuleApiRoute.login);
    return getConnectProvider.convertResponse(response, (json) => LoginResponse.fromJson(json));
  }
}
