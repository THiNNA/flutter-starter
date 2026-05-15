/// Base response for empty or generic API responses
class BaseResponse {
  final String? message;
  final bool success;

  BaseResponse({this.message, required this.success});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      message: json['message'] as String?,
      success: json['success'] as bool? ?? true,
    );
  }
}
