import 'dart:developer';
import 'package:flutter_clean_example_core/main.dart';
import 'package:flutter_clean_example_core/common/app_error.dart';
import 'package:flutter_clean_example_first_module/data/api/request/login_request.dart';
import '../../../domain/use_case/user_login_use_case.dart';

class FirstPageController extends GetxController {
  final UserLoginUseCase _userLoginUseCase;

  FirstPageController(this._userLoginUseCase);

  void login() async {
    try {
      final request = LoginRequest('123', '123');
      final response = await _userLoginUseCase.execute(request);
    } catch(e) {
      if (e is AppError) {
        log('status message ${e.message}');
        // update UI,...
      }
    }
  }
}