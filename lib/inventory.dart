import 'item.dart';

class Inventory {
  List<Item> items = [];

  void addItem(Item item) {
    items.add(item);
  }

  bool containsItem(Item item) {
    return items.contains(item);
  }
}
