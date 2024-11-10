import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:social_authentication_flutter/constatnts.dart';
import 'package:social_authentication_flutter/screens/LoginPage.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY'] ?? '',
        appId: dotenv.env['API_ID'] ?? '',
        messagingSenderId: dotenv.env['API_KEY'] ?? '',
        projectId: dotenv.env['API_KEY'] ?? '',
    )
  );
  runApp(SocialAthenticationFlutter());
}

class SocialAthenticationFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)
        ),
        home: LoginPage()
    );
  }
}
