//sử dụng response thay vì dto để xử lí trong trường hợp response trả về phức tạp
//nested object,... response đóng vai trò 1 wrapper class chứa thông tin và các object

class BaseResponse {
  late final int? statusCode;
  late final String? message;
}
