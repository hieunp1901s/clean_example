import 'package:flutter_clean_example_core/network/base_response.dart';
import 'package:flutter_clean_example_first_module/data/api/dto/change_password_dto.dart';

class ChangePasswordResponse extends BaseResponse {
  List<ChangePasswordDto> list = [];

  ChangePasswordResponse.fromJson(dynamic json)
      : list = toList(json?['list']);

  // phương thức để convert nested data phức tạp
  static List<ChangePasswordDto> toList(dynamic json) {
    final newList = <ChangePasswordDto>[];

    for (var item in json as List) {
      newList.add(ChangePasswordDto.fromJson(item));
    }

    return newList;
  }
}
