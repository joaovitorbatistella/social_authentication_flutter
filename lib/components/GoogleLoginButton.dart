import 'package:flutter/material.dart';
import 'package:social_authentication_flutter/services/AuthenticationService.dart';
import 'package:social_authentication_flutter/screens/HomePage.dart';

class GoogleLoginButton extends StatelessWidget {
  final AuthenticationService _authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () async {
            final user = await _authService.loginWithGoogle();

            if (user != null) {
              // Redireciona para a HomePage se o login for bem-sucedido
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              // Mostra um erro se o login falhar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Falha ao fazer login."),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("google.png"), width: 24),
              SizedBox(width: 10),
              Text("Entrar com Google", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
