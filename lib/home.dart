import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


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
              scale: 2,
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

  final String  _baseUrl = "serpapi.com";
  final String  _characterPath = "/search.json";
  final Map<String, String> _parametros = <String, String> {
    'q':'tenis',
    'tbm':'shop',
    'location':'Sao Paulo',
    'hl':'pt-br',
    'gl':'br',
    'api_key':'61e6e56345570d0bf6b3634f6fad08c80a5c4faadd85230dbe373037f098ceeb',
  };

  _getProdutoByDescricao() async {

    var uri = Uri.http(_baseUrl, _characterPath, _parametros);

    print(uri);

    http.Response response;
    response = await http.get(uri);

    if (response.statusCode == 200) {
      print (response.body);
      //Map<String, dynamic> retorno = convert.jsonDecode(response.body);
    } else {
      print("Erro: ${response.statusCode.toString()}");
    }
  }
}
