import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/tiles/fabricante_tile.dart';

class FabricantesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance.collection("produtos").getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator(),);
        else{
          var dividedTiles = ListTile.divideTiles(
            context: context,
              tiles: snapshot.data.documents.map<Widget>(
                      (doc){
                    return FabricanteTile(doc);
                  }
              ).toList()
          ).toList();

          return ListView(children: dividedTiles,);
        }
      },
    );
  }
}
