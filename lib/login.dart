import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_dart/auth.dart';
import 'criarConta.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  _validaCampo() {
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty && senha.length >= 6) {
        FirebaseAuth auth = FirebaseAuth.instance;
        auth
            .signInWithEmailAndPassword(email: email, password: senha)
            .then((value) => {
                  print("${value.toString()}"),
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false)
                });
      }
    }
  }

  _verificaUsuarioLogado() {
    User? usuarioLogado = FirebaseAuth.instance.currentUser;
    if (usuarioLogado != null) {
      setState(() {
        /*Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));*/
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      });
    }
  }

  _criarNovaConta() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => CriarConta())));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificaUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(hintText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _controllerSenha,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(hintText: "Senha"),
                ),
              ),
              ElevatedButton(
                  onPressed: _validaCampo, child: const Text("Logar")),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextButton(
                  child: Text("Criar nova Conta"),
                  onPressed: _criarNovaConta,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
