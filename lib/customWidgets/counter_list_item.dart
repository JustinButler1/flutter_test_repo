import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/enums.dart';

// ignore: must_be_immutable
class CounterListItem extends StatefulWidget {
  String title;
  ListItemType type;
  int? count;
  CounterListItem(
      {super.key, required this.title, required this.type, this.count});

  @override
  State<CounterListItem> createState() => _CounterListItemState();
}

class _CounterListItemState extends State<CounterListItem> {
  bool isEditing = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(32, 106, 106, 106)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (isEditing)
                  const Icon(CupertinoIcons.minus_circle, color: Colors.red),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title, style: const TextStyle(fontSize: 50)),
                      Text('${widget.count}',
                          style: const TextStyle(fontSize: 50))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
