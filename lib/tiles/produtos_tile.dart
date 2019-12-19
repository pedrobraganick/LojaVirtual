import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/produto_data.dart';

class ProdutosTile extends StatelessWidget {
  final String type;
  final ProdutoData data;

  ProdutosTile(this.type, this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid" ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.8,
              child: Image.network(
                  data.images[0],fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(data.title, style: TextStyle( fontWeight: FontWeight.w500,),softWrap: true,overflow: TextOverflow.ellipsis,),
                    Text("R\$ ${data.preco.toStringAsFixed(2)}", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            )
          ],
        ) :
        Row(),
      ),
    );
  }
}
