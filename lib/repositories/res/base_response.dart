class BaseResponse {
  String? code;
  String? message;
  dynamic data;

  BaseResponse({this.message, this.data, this.code});

  factory BaseResponse.fromMap(dynamic map) {
    return map is Map
        ? BaseResponse(
            code: map['code'] as String?,
            message: map['message'] as String?,
            data: map['data'],
          )
        : BaseResponse();
  }

  Map<String, dynamic> toMap() => {
        'code': code,
        'message': message,
        'data': data,
      };
}
