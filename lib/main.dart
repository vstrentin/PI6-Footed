import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pi6/LoginPage.dart';
import 'package:pi6/services/Auth_service.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp();

  runApp(
   
  // MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (context) => AuthService()),
  //   ],
  // ), 
    
   MaterialApp(
     home: LoginPage(),
     debugShowCheckedModeBanner: false,
   )
  );
}
