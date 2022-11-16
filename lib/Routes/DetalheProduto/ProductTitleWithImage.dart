import 'package:flutter/material.dart';
import 'package:pi6/Routes/BuilderAppBar.dart';
import 'package:pi6/pojo/ShoppingResult.dart';

class ProductTitleWithImage extends StatelessWidget {

   final ShoppingResult? produto;

   const ProductTitleWithImage({ required this.produto,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Text(
            "Pagina Informativa do Produto:",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            produto?.getTitle() == null ? "Tenis Nike Pro CR7" : produto?.getTitle(),
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Preço:\n",
                      style: TextStyle(color: Colors.white),
                      ),
                    TextSpan(
                      text: produto!.getPrice() == null ? "RS 30.99" : produto?.getPrice(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ]
                )
              ),
              SizedBox(width: 10),
              Expanded(child: Image(
                image: NetworkImage(produto?.getThumbnail() == null ? "https://i.pinimg.com/236x/dc/53/36/dc5336ecae262d3172c3483521964d9a.jpg" : produto?.getThumbnail()),
                fit: BoxFit.fitWidth,
              ))
            ],
          )
        ],
      ) ,
    );
  }

}
