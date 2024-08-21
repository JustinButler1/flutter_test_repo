import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

// ignore: must_be_immutable
class DetailListItem extends StatefulWidget {
  String text;
  DetailListItem({
    super.key,
    required this.text,
  });

  @override
  State<DetailListItem> createState() => _DetailListItemState();
}

class _DetailListItemState extends State<DetailListItem> {
  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of<ListProvider>(context);
    bool isEditing = listProvider.isEditing;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: (isEditing)
          ? null
          : () {
              // TODO: Go to text editing page
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
                    onPressed: () {},
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
                    Text(widget.text, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
