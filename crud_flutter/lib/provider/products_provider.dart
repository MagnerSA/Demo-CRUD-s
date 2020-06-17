import 'dart:math';

import 'package:crud_flutter/data/products_example.dart';
import 'package:crud_flutter/models/product.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  final Map<String, Product> _items = {...PRODUCTS_EXAMPLE};

  List<Product> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Product byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Product product) {
    if (product == null) {
      return;
    }

    if (product.id != null &&
        product.id.trim().isNotEmpty &&
        _items.containsKey(product.id)) {
      //add
      _items.update(
        product.id,
        (_) => Product(
          id: product.id,
          name: product.name,
          price: product.price,
          shelfLife: product.shelfLife,
          imageUrl: product.imageUrl,
        ),
      );
    } else {
      //update
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Product(
          id: id,
          name: product.name,
          price: product.price,
          shelfLife: product.shelfLife,
          imageUrl: product.imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Product product) {
    if (product != null && product.id != null){
      _items.remove(product.id);
      notifyListeners();
    }
  }
}
