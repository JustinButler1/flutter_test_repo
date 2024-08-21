import 'package:flutter/cupertino.dart';

import '../util/list_item_type.dart';
import '../widgets/counter_list_item.dart';

class ListProvider extends ChangeNotifier {
  List<CounterListItem> countCategories = [
    CounterListItem(title: "La", count: 6, type: ListItemType.countOnly),
    CounterListItem(title: "Ph", count: 8, type: ListItemType.nestedList),
    CounterListItem(title: "Ina", count: 16, type: ListItemType.countOnly),
    CounterListItem(title: "Fa", count: 6, type: ListItemType.countOnly),
  ];
  bool isEditing = false;

  void createCategory(String title, String type) {
    countCategories.add(
      CounterListItem(
        title: title,
        type: listItemTypeFromString(type),
        count: 0,
      ),
    );
    notifyListeners();
  }

  void removeCategory(CounterListItem item) {
    countCategories.remove(item);
    notifyListeners();
  }

  void increment(CounterListItem itemToFind) {
    int index = countCategories.indexOf(itemToFind);

    CounterListItem item = countCategories.elementAt(index);
    item.count++;
    notifyListeners();
  }

  void decrement(CounterListItem itemToFind) {
    int index = countCategories.indexOf(itemToFind);

    CounterListItem item = countCategories.elementAt(index);
    item.count--;
    notifyListeners();
  }

  void toggleEditing() {
    isEditing = !isEditing;
    notifyListeners();
  }
}
