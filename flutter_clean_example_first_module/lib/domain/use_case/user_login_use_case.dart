import 'dart:async';
import 'dart:developer';
import 'package:flutter_clean_example_first_module/data/api/request/login_request.dart';
import 'package:flutter_clean_example_first_module/domain/repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/api/response/login_response.dart';

//Nếu cần có thể chuyển future thành stream ở phần này
//trong use case có thể kết hợp nhiều repository để trả lại kết quả
//
abstract class UserLoginUseCase {
  Future<LoginResponse> execute(LoginRequest request);
}

class UserLoginUseCaseImpl implements UserLoginUseCase {
  final LoginRepository _loginRepository;

  UserLoginUseCaseImpl(this._loginRepository);

  @override
  Future<LoginResponse> execute(LoginRequest request) async {
    //bt ng ta sẽ chỉ return dto, nhưng mình sẽ return cả response
    //đề phòng trường hợp trong response trả về có nhiều hơn 1 dto
    return await _loginRepository.login(request);
  }
}

class UserLoginUseCaseImplV2 implements UserLoginUseCase {
  final LoginRepository _loginRepository;

  UserLoginUseCaseImplV2(this._loginRepository);

  //nếu muốn dùng rxdart thì dùng chung vs completer
  @override
  Future<LoginResponse> execute(LoginRequest request) async {
    final completer = Completer<LoginResponse>();

    Stream.value(true)
        .flatMap((value) => Stream.fromFuture(_loginRepository.login(request)))
    // .flatMap((value) => Stream.fromFuture(_loginRepository.changePassword()))
        .listen((event) {
      completer.complete(event);
    }, onError: (e) {
      completer.completeError(e);
    });

    return completer.future;
  }

}

