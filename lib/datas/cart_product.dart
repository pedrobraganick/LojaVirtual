import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/datas/produto_data.dart';

class CartProdutct {
  String cid;
  String category;
  String pid;
  int quantity;

  ProdutoData produtoData;

  CartProdutct();

  CartProdutct.fromDocument(DocumentSnapshot document){
    cid  = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document.data["quantity"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category":category,
      "pid":pid,
      "quantity":quantity,
      "product":produtoData.toResumedMap()
    };
  }
}