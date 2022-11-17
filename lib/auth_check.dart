import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pi6/LoginPage.dart';
import 'package:pi6/home.dart';
import 'package:pi6/services/Auth_service.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {

    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) return loading();
    else if(auth.usuario == null) return LoginPage();
    else return Home();
  }
  
  loading() {
    return Scaffold(
      body: Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }

  

}