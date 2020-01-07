import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/cart_product.dart';
import 'package:lojavirtual/datas/produto_data.dart';
import 'package:lojavirtual/models/cart_model.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screens/cart_screen.dart';
import 'package:lojavirtual/screens/login_screen.dart';

class ProdutScreen extends StatefulWidget {
  final ProdutoData produto;

  ProdutScreen(this.produto);

  @override
  _ProdutScreenState createState() => _ProdutScreenState(produto);
}

class _ProdutScreenState extends State<ProdutScreen> {

  final ProdutoData produto;

  _ProdutScreenState(this.produto);

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: produto.images.map( (url) { return NetworkImage(url);}).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(produto.title, style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.w500,
                ), maxLines: 3
                  ,),
                Text(
                  "R\$ ${produto.preco.toStringAsFixed(2)}",style: TextStyle(
                  fontSize: 22.0, fontWeight: FontWeight.bold, color: primaryColor
                ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed:  () {
                      if(UserModel.of(context).isLoggedIn()){
                        CartProdutct cartProduct = CartProdutct();
                        cartProduct.quantity = 1;
                        cartProduct.pid = produto.id;
                        cartProduct.category = produto.fabricante;
                        cartProduct.produtoData =produto;
                        CartModel.of(context).addCartItem(cartProduct);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
                      }
                      else{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      }
                    } ,
                    child: Text(UserModel.of(context).isLoggedIn() ? "Adicionar" : "Entre para comprar", style: TextStyle(fontSize: 18.0),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                )
                ,
                SizedBox(height: 16.0,),
            Text("Descrição", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            Text(produto.descricao, style: TextStyle(fontSize: 18.0)),

              ],
            ),
          )
        ],
      ),
    );
  }
}
