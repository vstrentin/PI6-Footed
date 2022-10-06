import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';
import 'package:firebase_dart/auth.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({Key? key}) : super(key: key);

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerRepetirSenha = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  String _mensagemErro = "";

  _validaCampos() {
    //recupera dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    String cpf = _controllerCpf.text;
    String repetirSenha = _controllerRepetirSenha.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (cpf.isNotEmpty && cpf.length == 11) {
          if (senha.isNotEmpty && senha.length >= 6) {
            if (senha == repetirSenha) {
              _cadastraUsuario(nome, email, senha, cpf);
            } else {
              setState(() {
                _mensagemErro = "As senhas devem ser iguais!";
              });
            }
          } else {
            setState(() {
              _mensagemErro = "A senha deve ter no minimo 6 caracteres!";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "O CPF deve conter 11 numeros!";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha corretamente o email!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha corretamente o seu nome!";
      });
    }
  }

  _cadastraUsuario(String nome, String email, String senha, String cpf) {
    FirebaseDatabase db = FirebaseDatabase.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    //db.reference().child("usuarios").child("alksjdlaksjlkasjfkl").set({"nome" : "Gustavo", "email" : "gus"});

    Map<String, dynamic> dadosUsers = {
      'nome': nome,
      'email': email,
      'cpf': cpf,
    };

    auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((firebaseUser) => {
              //alem disso seta os dados do usuario no banco realtime
              db.ref("usuarios").child(firebaseUser.user!.uid).set(dadosUsers),
              _mensagemErro = "Sucesso ao cadastrar!",
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false)
            })
        .catchError((error) {
      setState(() {
        _mensagemErro = "Erro ao cadastrar usuário, $error";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Criar Conta")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 10),
                  child: TextField(
                    controller: _controllerNome,
                    //autofocus: true,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(fontSize: 16),
                    autocorrect: false,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Insira seu nome completo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
                //email text
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerEmail,
                    //autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Insira seu e-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
                //cpf text
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerCpf,
                    //autofocus: true,
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Insira seu CPF",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
                //senha Text
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerSenha,
                    autocorrect: false,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Insira sua senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
                //repetir Senha Text
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 16),
                  autocorrect: false,
                  controller: _controllerRepetirSenha,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Repita sua senha sua senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                      //isLoading ? () => _portariaRoute() : null,
                      //_isEnable ? () => _validaCampos() : null,
                      onPressed: () {
                        _validaCampos();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                          elevation: 0,
                          padding: EdgeInsets.all(12),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20))),
                      child: Text(
                        "Criar Conta",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                ),

                //mensagem de erro
                Center(
                  child: Text(
                    _mensagemErro,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
