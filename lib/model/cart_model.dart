import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['bread', 'Bread', '5.49', 'assets/items/bread.png'],
    ['milk', 'Milk', '6.25', 'assets/items/milk.png'],
    ['croissant', 'Croissant', '7.89', 'assets/items/croissant.png'],
    ['frappe', 'Frappe', '12.75', 'assets/items/frappe.png'],
    ['latte', 'Latte', '11.40', 'assets/items/latte.png'],
    ['cupcake', 'Cupcake', '8.30', 'assets/items/cupcake.png'],
    ['donut', 'Donut', '6.95', 'assets/items/donut.png'],
    [
      'strawberry',
      'Strawberry Cake',
      '15.99',
      'assets/items/strawberry-cake.png',
    ],
    ['smoothie', 'Smoothie', '13.60', 'assets/items/smoothie.png'],
    ['pancakes', 'Pancakes', '10.45', 'assets/items/pancakes.png'],
    ['cookies', 'Cookies', '7.15', 'assets/items/cookies.png'],
  ];
  final List<Map<String, dynamic>> _cartItems = [];

  List get shopItems => _shopItems;
  List get cartItems => _cartItems;

  void addItemToCard(int index) {
    final id = _shopItems[index][0];
    final name = _shopItems[index][1];
    final price = _shopItems[index][2];
    final image = _shopItems[index][3];

    final existingIndex = _cartItems.indexWhere((e) => e['id'] == id);
    if (existingIndex != -1) {
      _cartItems[existingIndex]['qty'] =
          (_cartItems[existingIndex]['qty'] as int) + 1;
    } else {
      _cartItems.add({
        'id': id,
        'name': name,
        'price': price,
        'image': image,
        'qty': 1,
      });
    }
    notifyListeners();
  }

  void removeItemFromCard(int index) {
    if (index < 0 || index >= _cartItems.length) return;
    final currentQty = _cartItems[index]['qty'] as int;
    if (currentQty > 1) {
      _cartItems[index]['qty'] = currentQty - 1;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (final item in _cartItems) {
      final unit = double.tryParse(item['price'] as String) ?? 0;
      totalPrice += unit * (item['qty'] as int);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
