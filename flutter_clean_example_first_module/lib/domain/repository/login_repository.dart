import 'package:flutter_clean_example_first_module/data/api/request/login_request.dart';
import '../../data/api/response/change_password_response.dart';
import '../../data/api/response/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<ChangePasswordResponse> changePassword();
}