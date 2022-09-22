import 'dart:convert';

class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.accessToken,
  });

  int id;
  String accessToken;

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        id: json["id"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "access_token": accessToken,
      };
}
