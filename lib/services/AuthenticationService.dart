import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationService {

  bool loading = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: "511991179361-3hpd66igq7p9pa37l8lulqckga0mdbjn.apps.googleusercontent.com",
  );

  String ?userName = "";
  String ?userEmail = "";
  String ?userUrl = "";

  Future<bool> _googleLogin() async {
    try {
      GoogleSignInAccount ?account;
      loading = true;

      account = await _googleSignIn.signIn();

      if(account == null) {
        loading = false;
        return false;
      }

      userName = account.displayName;
      userEmail = account.email;
      userUrl = account.photoUrl;

      print({
        userUrl,
        userEmail,
        userName
      });

      loading = false;
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      loading = false;
    }
  }

  void loginWithGoogle() async {
    try {
      loading = true;

      final result = await _googleLogin();

      loading = false;

      result ? print("Logged in") : print("Error");
    } catch (e) {
      print(e.toString());
    } finally {
      loading = false;
    }
  }

}