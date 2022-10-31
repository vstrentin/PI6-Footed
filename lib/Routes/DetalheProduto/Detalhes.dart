import 'package:flutter/material.dart';
import 'package:pi6/Routes/BuilderAppBar.dart';
import 'package:pi6/Routes/DetalheProduto/ProductTitleWithImage.dart';
import 'package:pi6/pojo/ShoppingResult.dart';

class Detalhes extends StatelessWidget {

  //final ShoppingResult produto;

  //const Detalhes({super.key, required this.produto});

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
                            Text(
                              "Avaliação: \n ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "4.4",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ]),
                      //Icon
                    ),
                    ProductTitleWithImage()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}





