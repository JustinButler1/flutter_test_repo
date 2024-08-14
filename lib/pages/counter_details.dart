import 'package:flutter/cupertino.dart';

import '../util/enums.dart';

// ignore: must_be_immutable
class ListItemDetailsPage extends StatefulWidget {
  String title;
  ListItemType type;
  int count;
  ListItemDetailsPage(
      {super.key,
      required this.title,
      required this.type,
      required this.count});

  @override
  State<ListItemDetailsPage> createState() => _ListItemDetailsPageState();
}

class _ListItemDetailsPageState extends State<ListItemDetailsPage> {
  int count = 0;

  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  Widget _counterBuild(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: SafeArea(
          child: Center(
              child: Column(children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 128),
            ),
            Center(
              child: Column(children: [
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      count += 1;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.chevron_up,
                    size: 128,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      count -= 1;
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 128,
                  ),
                ),
              ]),
            )
          ])),
        ));
  }

  Widget _listCounterBuild(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: const SafeArea(
        child: Text('List'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.type == ListItemType.countOnly)
        ? _counterBuild(context)
        : _listCounterBuild(context);
  }
}
