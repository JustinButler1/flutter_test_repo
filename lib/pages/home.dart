import 'package:flutter/cupertino.dart';

import '../customWidgets/counter_list_item.dart';
import '../util/enums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('Sleep Sounds'),
            trailing: Icon(CupertinoIcons.create)),
        child: ListView(
          children: [
            CounterListItem(
                title: "Laughs", count: 6, type: ListItemType.countOnly),
            CounterListItem(
                title: "Phrases", count: 8, type: ListItemType.nestedList),
            CounterListItem(
                title: "Inaudible", count: 16, type: ListItemType.countOnly),
            CounterListItem(
                title: "Fart", count: 6, type: ListItemType.countOnly),
          ],
        ));
  }
}
