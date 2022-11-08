import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pi6/Controller/DialogExample.dart';
import 'package:pi6/Routes/ListaProduto.dart';
import 'package:pi6/getProdutoByDescricao.dart';
import 'dart:convert' as convert;

import 'package:pi6/pojo/ShoppingResult.dart';



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

class _HomeState extends State<Home> {
  File? _image;
  TextEditingController _controllerDesc = TextEditingController();

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
        backgroundColor:Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_rounded),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.supervisor_account),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            Image.asset(
              'images/pesquisando_mulher.png',
              scale: 2,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: _controllerDesc,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "Product Description...",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                    title: "Tirar uma Foto",
                    icon: Icons.camera_alt_outlined,
                    onclick: () => (ImageSource.camera)),
                SizedBox(height: 10),
                CustomButton(
                  title: "Escolher Da Galeria",
                  icon: Icons.image_outlined,
                  onclick: () => (ImageSource.gallery),
                ),
                SizedBox(height: 10),
                CustomButton(
                  title: "Pesquisar",
                  icon: Icons.search,
                  onclick: (_getProdutoByDescricao),
                  
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
  
  _getProdutoByDescricao() async {
    String _description = _controllerDesc.text;
    if (!_description.isEmpty) {

      GetProdutoByDescricao buscarProdutos = GetProdutoByDescricao(_description);
      List<ShoppingResult> products = buscarProdutos.getProdutoByDescricao(context);
      
      //print(products.length);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => ListaProduto(products)));

    } else {
      DialogExample dialogExample = DialogExample();
      dialogExample.showDialogErro(context, "Erro!" , "Informe uma descrição para o pesquisa.");
    }
  }
}
