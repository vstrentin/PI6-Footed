import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pi6/Routes/DetalheProduto/Detalhes.dart';
import 'package:pi6/home.dart';
import 'package:pi6/pojo/ShoppingResult.dart';

class ItemCard extends StatelessWidget {
  final ShoppingResult? shoppingResult;
  //final Function? press;

  ItemCard(this.shoppingResult);

  // const ItemCard({
  //   Key? key,
  //   this.shoppingResult,
  //   this.press,
  // }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 180,
          // width: 160,
          decoration: BoxDecoration(
            color: Color.fromARGB(108, 69, 7, 202),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image(image: NetworkImage(shoppingResult?.getThumbnail() == null ? "https://i.pinimg.com/236x/dc/53/36/dc5336ecae262d3172c3483521964d9a.jpg" : shoppingResult?.getThumbnail())),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Text(
              shoppingResult?.title == null ? "Tenis Nike Pro CR7" : shoppingResult?.getTitle(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
                ),
            ),
          ),
          Text(
            shoppingResult?.getPrice() == null ? "RS 30.99" :  shoppingResult?.getPrice(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 10.0,
              )
          ),
          CustomButton(
                    title: "explorar",
                    icon: Icons.search,
                    onclick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detalhes())),
                  )
      ],
    );
  }
}