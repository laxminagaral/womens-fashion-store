import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hand Bag",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
          ),
    
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              height: 100,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price"),
                    TextSpan(
                        text: "\$${product.price}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)
                            ),
                  ],
                ),
              ),
            ),
            SizedBox(width:25),
            Expanded(
              child: Hero(
                tag: "${product.id}",
                              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
                ),
              ),),
          ])
        ],
      ),
    );
  }
}
