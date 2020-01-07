import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/produto_data.dart';
import 'package:lojavirtual/tiles/produtos_tile.dart';

class ProdutosScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  ProdutosScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on),),
              Tab(icon: Icon(Icons.list),)
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("produtos").document(snapshot.documentID).collection("itens").getDocuments(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            else{
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  GridView.builder(
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0,childAspectRatio: 0.65),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,index){
                      return ProdutosTile("grid", ProdutoData.fromDocument(snapshot.data.documents[index],fabricante: this.snapshot.documentID));
                    }),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,index){
                      return ProdutosTile("list", ProdutoData.fromDocument(snapshot.data.documents[index], fabricante: this.snapshot.documentID));
                    },
                  )
                ],
              );
            }
          },
        )
      ),
    );
  }
}
