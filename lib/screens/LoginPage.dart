import 'package:flutter/material.dart';
import 'package:social_authentication_flutter/components/GoogleLoginButton.dart';
// import 'package:primeiro_app/screens/MainScreen.dart';
// import 'package:primeiro_app/services/servico_autenticacao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController(text: 'emilys');
  final passwordController = TextEditingController(text: 'emilyspass');
  bool loging = false;

  // final authenticateService = ServicoAutenticacao();

  Future<void> registerLogin() async{
    if(!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      loging = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Loging..."))
    );

    // try {
    //   final userLogin = await authenticateService.login(
    //       userController.text,
    //       passwordController.text
    //   );
    //
    //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //
    //   // if(userLogin != null) {
    //   //   Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
    //   // }
    // } catch(e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(e.toString()),
    //         backgroundColor: Colors.red.shade300,
    //       )
    //   );
    // } finally {
    //   setState(() {
    //     loging = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Opacity(
                opacity: 0.4,
                child: Icon(
                    Icons.person_outline,
                    size: 100,
                    color: Colors.redAccent
                ),
              ),
              GoogleLoginButton()
            ],
          )
      ),
    );
  }
}