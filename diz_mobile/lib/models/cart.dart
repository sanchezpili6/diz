

import 'package:flutter/foundation.dart';
class CartItem{
  final String id;
  final String name;
  final int cantidad;
  final double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.cantidad,
    @required this.price});
}

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items{
    return{..._items};
  }

  int get itemCount{
    return _items.length;
  }

  void addItem(String pdtid, String name, double price){
    if(_items.containsKey(pdtid)){
      _items.update(pdtid, (existingCartItem) =>
      CartItem(
          id: DateTime.now().toString(),
          name: existingCartItem.name,
          cantidad: existingCartItem.cantidad+1,
          price: existingCartItem.price));
    }else{
      _items.putIfAbsent(pdtid, () => CartItem(
        name: name,
        id: DateTime.now().toString(),
        cantidad: 1,
        price: price,
      ));
    }
    notifyListeners();
  }

//remove the items from the card
void removeItem(String id){
    _items.remove(id);
    notifyListeners();
}
//Remove single item in cart
void removeSingleItem(String id){
    //if the item is not present in the cart then we can not remove it
  if(!_items.containsKey(id)){
    return;
  }if(_items[id].cantidad>1){
    _items.update(id,
            (existingCartItem) => CartItem(
        id: DateTime.now().toString(),
        name: existingCartItem.name,
        cantidad: existingCartItem.cantidad - 1,
        price: existingCartItem.price));


  }
  notifyListeners();
}

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.cantidad;
    });
    return total;
  }

void clear(){
    _items = {};
    notifyListeners();
}

}
