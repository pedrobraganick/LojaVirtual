
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoData{
  String fabricante;
  String id;
  String title;
  String descricao;
  double preco;
  List images;

  ProdutoData.fromDocument(DocumentSnapshot snapshot , {dynamic fabricante}){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    descricao = snapshot.data["descricao"];
    preco = snapshot.data["preco"] + 0.0;
    images = snapshot.data["image"];
    if(fabricante != null)
      this.fabricante = fabricante;
  }

  Map<String, dynamic> toResumedMap(){
    return {
      "title":title,
      "descricao":descricao,
      "preco":preco
    };
  }
}