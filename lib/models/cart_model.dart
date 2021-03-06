import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojavirtual/datas/cart_product.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model{
  UserModel user;
 List<CartProdutct> products = [];

 bool isLoading = false;

 CartModel(this.user);

 static CartModel of(BuildContext context) => ScopedModel.of<CartModel>(context);

 void addCartItem(CartProdutct cartProduct){
   products.add(cartProduct);
   Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("cart").add(cartProduct.toMap()).then(
       (doc) {
         cartProduct.cid = doc.documentID;
       }
   );

   notifyListeners();
 }

 void removeCartItem(CartProdutct cartProdutct){
  Firestore.instance.collection("users").document(user.firebaseUser.uid)
      .collection("cart").document(cartProdutct.cid).delete();
  products.remove(cartProdutct);
  notifyListeners();
 }
}