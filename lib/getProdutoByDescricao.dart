import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pi6/pojo/produto.dart';

class GetProdutoByDescricao {

  String? description;
  final String _baseUrl = "serpapi.com";
  final String _characterPath = "/search.json";

  GetProdutoByDescricao(String description){
    this.description = description;
  }

  getProdutoByDescricao() async {

    final Map<String, String> _parametros = <String, String> {
    'q': description.toString(),
    'tbm':'shop',
    'location':'Sao Paulo',
    'hl':'pt-br',
    'gl':'br',
    'api_key':'61e6e56345570d0bf6b3634f6fad08c80a5c4faadd85230dbe373037f098ceeb',
    'num' : '3'
    };

    var uri = Uri.http(_baseUrl, _characterPath, _parametros);
    http.Response response;
    response = await http.get(uri);

    if (response.statusCode == 200) {
      

      Map<String, dynamic> jsonMap = convert.jsonDecode(response.body);
      //print (response.body);
      //print (jsonMap);

      //print (jsonMap.keys);     
      jsonMap.remove('search_metadata');
      jsonMap.remove('search_parameters');
      jsonMap.remove('search_information');
      jsonMap.remove('pagination');
      jsonMap.remove('serpapi_pagination');
      jsonMap.remove('ads');
      jsonMap.remove('filters');
      jsonMap.remove('inline_shopping_results');
      
      //print (response.body);
      //print (jsonMap.keys);
      //print (jsonMap);

      print (convert.jsonEncode(jsonMap));

      List<InlineShoppingResult> listaProduto = convert.jsonDecode(convert.jsonEncode(jsonMap));
      //listaProduto = (jsonMap as List).map((item) => InlineShoppingResult.fromJson(item)).toList();

      return response.body;
      
    } else {
      print("Erro: ${response.statusCode.toString()}");
    }
  }
}