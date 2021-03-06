import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 8.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context,child,model){
                int p = model.products.length;
                return Text("${p ?? 0} ${p ==1 ? "Item" : "Itens"}"
                    ,style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context,child,model){
          if(model.isLoading && UserModel.of(context).isLoggedIn())
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
