library email_otp_auth;

import 'package:http/http.dart' as http;
import 'dart:convert';

/// Email OTP Auth
class EmailOtpAuth {
  /// veriable's for [EmailOtpAuth]
  static String _email = "";
  static String _hash = "";

  /// To send an OTP to a user's email address, use the [sendOTP] method. This method takes the recipient's email address as a parameter.
  /// [email] : The email address to which the OTP will be sent.
  static Future<Map<String, dynamic>> sendOTP({required String email}) async {
    try {
      // creating url
      var url =
          Uri.https("direct-robbi-kamesh-cc8a724a.koyeb.app", "/otp-login");

      // sending post request and getting response
      var res = await http.Client().post(
        url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: jsonEncode({
          "email": email,
        }),
      );

      // converting JSON to Map()
      Map<String, dynamic> mapData = jsonDecode(res.body);

      // assigning email & hash key
      _email = email;
      _hash = mapData["data"];

      return mapData;

      // returning json Decoded data.
    } catch (error) {
      throw error.toString();
    }
  }

  /// To verify OTP we use the [verifyOtp] method. This method takes the recipient's OTP as a parameter.
  /// [otp] : The OTP that we send via Email Address.
  static Future<Map<String, dynamic>> verifyOtp({
    required String otp,
  }) async {
    try {
      // creating url
      var url =
          Uri.https("direct-robbi-kamesh-cc8a724a.koyeb.app", "/otp-verify");

      // sending post request and getting response
      var res = await http.Client().post(
        url,
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: jsonEncode({
          "email": _email,
          "hash": _hash,
          "otp": otp,
        }),
      );

      // converting JSON to Map()
      Map<String, dynamic> mapData = jsonDecode(res.body);

      // returning json Decoded data.
      return mapData;
    } catch (error) {
      throw error.toString();
    }
  }
}
