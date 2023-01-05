class ServerResponse {
  bool success;
  String code;
  dynamic data;
  String message;
  String ip;

  ServerResponse({required this.success, required this.code, this.data, required this.message, required this.ip});

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      ip: json['ip'],
  );
}