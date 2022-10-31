import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:pi6/Controller/DialogExample.dart';
import 'package:pi6/Routes/listaProduto.dart';
import 'package:pi6/home.dart';
import 'dart:convert' as convert;

import 'package:pi6/pojo/Product.dart';
import 'package:pi6/pojo/ShoppingResult.dart';

class GetProdutoByDescricao {

  String? description;
  final String _baseUrl = "serpapi.com";
  final String _characterPath = "/search.json";
  DialogExample dialogExample = DialogExample();

  GetProdutoByDescricao(String description){
    this.description = description;
  }

  getProdutoByDescricao(BuildContext context) async {

    final Map<String, String> _parametros = <String, String> {
    'q': description.toString(),
    'tbm':'shop',
    'location':'Sao Paulo',
    'hl':'pt-br',
    'gl':'br',
    'api_key':'61e6e56345570d0bf6b3634f6fad08c80a5c4faadd85230dbe373037f098ceeb',
    'num' : '5'
    };

    var uri = Uri.http(_baseUrl, _characterPath, _parametros);
    http.Response response;
    response = await http.get(uri);

    if (response.statusCode == 200) {
      try{

        Product produtos = Product.fromJson(convert.jsonDecode(response.body));//convert.jsonDecode(response.body);
        print(produtos.getShoppingResult());
        //return produtos.getShoppingResult();

        Navigator.push(context, MaterialPageRoute(builder: (context) => ListaProduto(produtos.getShoppingResult())));

      }on Exception catch (exception){
        print("Storo Catch");
        dialogExample.showDialogErro(context, "", exception.toString());
      }
    } else {
      dialogExample.showDialogErro(context, response.statusCode.toString(), "");
      print("Erro: ${response.statusCode.toString()}");
    }
  }
}