import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../pages/counter_details.dart';
import '../providers/list_provider.dart';
import '../util/enums.dart';

// ignore: must_be_immutable
class CounterListItem extends StatefulWidget {
  String title;
  ListItemType type;
  int count = 0;
  CounterListItem(
      {super.key,
      required this.title,
      required this.type,
      required this.count});

  @override
  State<CounterListItem> createState() => _CounterListItemState();
}

class _CounterListItemState extends State<CounterListItem> {
  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of<ListProvider>(context);
    bool isEditing = listProvider.isEditing;
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: (isEditing)
            ? null
            : () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return ListItemDetailsPage(item: widget);
                }));
              },
        child: Container(
          height: 80.0,
          decoration:
              const BoxDecoration(color: Color.fromARGB(32, 106, 106, 106)),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (isEditing)
                  CupertinoButton(
                      onPressed: () {
                        listProvider.removeCategory(widget);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(CupertinoIcons.minus_circle,
                              color: CupertinoColors.destructiveRed))),
                const SizedBox(width: 10),
                Expanded(
                    child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title, style: const TextStyle(fontSize: 40)),
                      Text('${widget.count}',
                          style: const TextStyle(
                              fontSize: 40,
                              color: CupertinoColors.inactiveGray)),
                    ],
                  ),
                )),
                if (widget.type == ListItemType.countOnly)
                  const Icon(CupertinoIcons.number,
                      size: 15.0, color: CupertinoColors.inactiveGray)
                else
                  const Icon(CupertinoIcons.list_dash,
                      size: 15.0, color: CupertinoColors.inactiveGray),
                const Icon(CupertinoIcons.chevron_forward, size: 40.0)
              ],
            ),
          ),
        ));
  }
}

// void navigation(String pageTitle, ListItemType type, BuildContext context) {
//   Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
//     return (type == ListItemType.countOnly)
//         ? CounterDetails(title: pageTitle)
//         : null;
//   }));
// }
