import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pi6/Routes/DetalheProduto/Detalhes.dart';
import 'package:pi6/Routes/ItemCard.dart';
import 'package:pi6/home.dart';
import 'package:pi6/pojo/ShoppingResult.dart';
import 'dart:convert' as convert;

class ListaProduto extends StatefulWidget {
  final List<ShoppingResult> listShoppingResult;
  //const listaProduto({super.key, this.listProducts});

  ListaProduto(this.listShoppingResult);

  @override
  State<ListaProduto> createState() => _listaProdutoState();
}

class _listaProdutoState extends State<ListaProduto> {
  @override
  void initState() {

    // if (widget.listShoppingResult == null){

    //   ShoppingResult produto1 = ShoppingResult();
    //   produto1.title = "";

    //   ShoppingResult produto2 = ShoppingResult();
    //   produto2.title = "";
    // }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_rounded),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));},
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
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: widget.listShoppingResult.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ), 
                itemBuilder: (context, index) => 
                  ItemCard(
                    widget.listShoppingResult[index],
                    //press: {} => Navegator.push(context, MaterialPageRoute(builder: (context) => Detalhes(widget.listShoppingResult[index])))
                    
                  ),
              ),
            ),
          ),
      )
    );
  }
}
