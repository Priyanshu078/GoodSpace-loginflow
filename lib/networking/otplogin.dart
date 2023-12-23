import 'package:dio/dio.dart';

class OtpLogin {
  final BASEURL = "https://api.ourgoodspace.com";

  Future<void> sendOtpOnPhoneNumber(String number, String countryCode) async {
    var dio = Dio();
    String endPoint = "/api/d2/auth/v2/login";
    String url = BASEURL + endPoint;
    var response = await dio.post(
      url,
      options: Options(headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImlhdCI6MTYyMjYwNDY4MH0.ZQxGVUbEZFpSyRYNEeTQysh4fNomDM_RS5XUSqx7YyY",
        "Content-Type": "application/json",
        "Device-Type": "web",
        "Device-Id": "2b38f716-9dd4-4a9d-b03a-d0f8872e4b5a"
      }),
      data: {
        "number": number,
        "countryCode": countryCode,
        "reCaptchaToken": "",
        "recaptchaAction": "LOGIN"
      },
    );
    var jsonData = response.data;
    print(jsonData);
  }

  Future<void> verifyOtp() async {
    String endPoint = "/api/d2/auth/verifyotp";
    String url = BASEURL + endPoint;
  }
}
