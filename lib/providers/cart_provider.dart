import 'package:flutter/material.dart';
import 'package:jumia_app/models/products_model.dart';

class CartProvider extends ChangeNotifier {

  List<ProductsModel> _cartItems = [];
  List<ProductsModel> get cartItems => _cartItems;
  set addItem(ProductsModel product) {
    bool hasUpdated = false;
    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].id == product.id) {
hasUpdated= true;
        _cartItems[i].qty = _cartItems[i].qty+ product.qty;
      } 
      
    
    }
  if( hasUpdated == false){
         _cartItems.add(product);
      }
    notifyListeners();
  }
  void updateQuantities(ProductsModel product){
    int index = _cartItems.indexOf(product); 
print(index.toString());
  }
   int  totalPrice (){

    int total = 0;

   for (var i = 0; i < _cartItems.length; i++) {
 
      total = total +(_cartItems[i].price * _cartItems[i].qty );
      
    
    }
    return total;
  }
}
