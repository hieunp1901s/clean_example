import 'package:flutter_clean_example_core/network/base_response.dart';
import '../dto/login_dto.dart';

class LoginResponse extends BaseResponse {
  final LoginDto loginDto;

  LoginResponse.fromJson(dynamic json)
      : loginDto = LoginDto.fromJson(json?['data']);
}
