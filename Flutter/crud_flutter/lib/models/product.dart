import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String shelfLife;
  final String imageUrl;

  const Product({
    this.id,
    @required this.name,
    @required this.price,
    @required this.shelfLife,
    @required this.imageUrl,
  });
}