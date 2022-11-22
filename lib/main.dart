import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pi6/services/Auth_service.dart';
import 'home.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MultiProvider(
  providers:
   [
    ChangeNotifierProvider(create: ((context) => AuthService())),      
   ],
   child: Home()
   )); 

  
}
