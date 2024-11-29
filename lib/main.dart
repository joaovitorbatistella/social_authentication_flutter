import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_authentication_flutter/screens/LoginPage.dart';
import 'package:social_authentication_flutter/screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY'] ?? '',
      appId: dotenv.env['API_ID'] ?? '',
      messagingSenderId: dotenv.env['API_KEY'] ?? '',
      projectId: dotenv.env['API_KEY'] ?? '',
    ),
  );
  runApp(SocialAuthenticationFlutter());
}

class SocialAuthenticationFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: AuthWrapper(),
    );
  }
}

// Widget para verificar o estado de autenticação do usuário
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Se o usuário estiver autenticado, exibe a HomePage
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user == null ? LoginPage() : HomePage();
        }

        // Exibe uma tela de carregamento enquanto verifica
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
