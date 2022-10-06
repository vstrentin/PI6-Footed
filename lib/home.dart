import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pi6/login.dart';
import 'package:firebase_dart/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onclick,
}) {
  return Container(
    width: 180,
    child: ElevatedButton(
        onPressed: onclick,
        child: Row(
          children: [Icon(icon), Text(title)],
        )),
  );
}
////////////////////////////////////////////////TELA RESULTADOS///////////////////////////////////////////////////////////////////

class telaResultados extends StatelessWidget {
  const telaResultados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Nome do Item $index \n'
                      'Preço do Item'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////TELA FAVORITOS///////////////////////////////////////////////////////////////////

class telaFavoritos extends StatelessWidget {
  const telaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Nome do Item $index \n'
                      'Preço do Item'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///  ///Teste do Home do professor com o login
///
class _HomeState extends State<Home> {
  String _nome = "carregando...";
  String _email = "carregando...";
  String _cpf = "carregando...";
  //deslogar
  _deslogar() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    setState(() {
      //deslogar para a pagina de login
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
      //Navigator.pop(context);
    });
  }

  String _getDate() {
    var now = new DateTime.now();
    var dateFormat = new DateFormat('yyyy-MM-dd hh:mm:ss');
    //var dateFormat = new DateFormat('MMMM-yyyy');
    var newFormat = dateFormat;
    //String formattedDate = formatter.format(now);
    String dataFormatada = newFormat.format(now);
    return dataFormatada;
  }

  _criarPost() async {
    FirebaseDatabase db = FirebaseDatabase.instance;
    User? usuarioLogado = FirebaseAuth.instance.currentUser;
    String dataFormat = _getDate();
    Map<String, dynamic> post = {
      'Usuario': _nome,
      'Horario': dataFormat,
      'conteudo': 'Qualquer coisa, qualquer coisa'
    };
    await db
        .ref("usuarios")
        .child(usuarioLogado!.uid)
        .child("posts")
        .child(dataFormat)
        .set(post);
  }

  _userDataLoading() async {
    User? usuarioLogado = FirebaseAuth.instance.currentUser;
    FirebaseDatabase db = FirebaseDatabase.instance;

    db.ref("usuarios").child(usuarioLogado!.uid).onValue.listen((event) {
      var snapshot = event.snapshot;
      String _nomeR = (snapshot.value as dynamic)["nome"];
      String _emailR = (snapshot.value as dynamic)["email"];
      String _cpfR = (snapshot.value as dynamic)["cpf"];
      print("\n\n VEIO $_nome \n\n");

      setState(() {
        if (_emailR != null) {
          if (_nomeR != null) {
            if (_cpfR != null) {
              _nome = "$_nomeR";
              _email = _emailR;
              _cpf = _cpfR;
            } else {
              print("Não carregou");
            }
          }
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_deslogar();
    _userDataLoading();
  }

  ////////////////////////////////////////////////////////////////////////////////
  ///

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(108, 69, 7, 202),
        title: Text("Footed"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            Image.asset(
              'images/pesquisando_mulher.png',
              scale: 500,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: MySearchDelegate(),
                      );
                    },
                    icon: const Icon(Icons.search)),
                //SizedBox(height: 10),
                CustomButton(
                    title: "Tirar uma Foto",
                    icon: Icons.camera_alt_outlined,
                    onclick: () => (ImageSource.camera)),
                //SizedBox(height: 10),
                CustomButton(
                  title: "Escolher Da Galeria",
                  icon: Icons.image_outlined,
                  onclick: () => (ImageSource.gallery),
                ),
                //SizedBox(height: 10),
                CustomButton(
                  title: "Tela Resultados",
                  icon: Icons.view_stream_outlined,
                  onclick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const telaResultados()));
                  },
                ),
                CustomButton(
                  title: "Tela Favoritos",
                  icon: Icons.favorite_outline,
                  onclick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const telaFavoritos()));
                  },
                ),
                CustomButton(
                  title: "Tela Login",
                  icon: Icons.login_outlined,
                  onclick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
