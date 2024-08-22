import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

// ignore: must_be_immutable
class DetailListItem extends StatefulWidget {
  String text;
  Function onDelete;
  DetailListItem({
    super.key,
    required this.text,
    required this.onDelete,
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
      padding: const EdgeInsets.only(top: 1.0),
      onPressed: (isEditing) ? null : () {},
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
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
                      widget.onDelete();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: const Icon(CupertinoIcons.minus_circle,
                            color: CupertinoColors.destructiveRed))),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.text,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
