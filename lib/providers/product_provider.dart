import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {}

@immutable
class Item {
  final int id;
  final String name;

  Item(this.id, this.name);
}
