import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/produto_data.dart';

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
                Text("Cor", style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
