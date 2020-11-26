import 'package:flutter/material.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Container(
      
          height:32, width:32,
          decoration: BoxDecoration(
            color:Colors.red,
            shape:BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              child:Row(
                
                children: <Widget>[
                Icon(Icons.favorite,color: Colors.white,size: 20,)
              ],)
            ),
          ),
          
        ),
        
      ],
    );
  }
}


