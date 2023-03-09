import 'package:flutter_clean_example_core/network/base_request.dart';

//extends baserequest để đỡ quên hàm map sang request
class LoginRequest extends BaseRequest {
  final String userName;
  final String password;

  LoginRequest(this.userName, this.password);

  @override
  Map<String, dynamic> toRequest() => {
    'userName': userName,
    'password': password
  };
}