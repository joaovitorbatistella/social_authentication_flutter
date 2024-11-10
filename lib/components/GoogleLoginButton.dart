import 'package:flutter/material.dart';
import 'package:social_authentication_flutter/services/AuthenticationService.dart';

class GoogleLoginButton extends StatelessWidget {
  // const GoogleLoginButton({super.key});

  AuthenticationService authenticationservice = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white
            ),
            onPressed: () {
              authenticationservice.loginWithGoogle();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage("google.png")
                ),
                Text("Entrar com Google")
              ],
            )
        ),
      ),
    );
  }
}
