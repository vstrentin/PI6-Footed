import 'package:flutter/material.dart';
import 'package:pi6/Controller/dialogExample.dart';
import 'package:pi6/Routes/BuilderAppBar.dart';
import 'package:pi6/Routes/DetalheProduto/ProductTitleWithImage.dart';
import 'package:pi6/pojo/ShoppingResult.dart';
import 'package:pi6/home.dart';

class Detalhes extends StatelessWidget {

  final ShoppingResult? produto;

  const Detalhes({super.key, required this.produto});

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,// Color.fromARGB(108, 69, 7, 202),
      appBar: AppBar(
        backgroundColor: Colors.purple,// Color.fromARGB(108, 69, 7, 202),
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.4),
                      padding: EdgeInsets.only(top: size.height * 0.12, left: 10, right: 10),
                      //height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)
                        )
                      ),
                      child: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Loja:\n",
                                      style: TextStyle(color: Colors.black),
                                      ),
                                    TextSpan(
                                      text: produto?.getSource() == null ? 'Desconhecida' : produto?.getSource(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ]
                                )
                              ),
                            ),
                            IconButton(
                              onPressed: () {_adicionarFavorito(context);},
                              icon: Icon(Icons.star_rounded),
                              color: Colors.yellow,
                            ),
                            IconButton(
                              onPressed: () {_adicionarFavorito(context);},
                              icon: Icon(Icons.favorite),
                              color: Colors.red,
                            ),
                            IconButton(
                              onPressed: () {_adicionarFavorito(context);},
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Avaliação:\n",
                                        style: TextStyle(color: Colors.black),
                                        ),
                                      TextSpan(
                                        text: "5.0",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ]
                                  )
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Delivery:\n",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: produto?.getDelivery() == null ? "Sem Informações" : produto?.getDelivery(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ]
                                )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: CustomButton(
                            icon: Icons.screen_share,
                            onclick: () => {},
                            title: "   Ir Para Loja"                    
                          ),
                        )
                      ]),
                    ),
                    ProductTitleWithImage(produto: produto)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _adicionarFavorito(BuildContext context) async {
    DialogExample dialog = DialogExample();
    dialog.showDialogSuccess(context, "Sucesso", "Item adicionado aos favorito!");
  }

}





