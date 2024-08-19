import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of<ListProvider>(context);
    bool isEditing = listProvider.isEditing;

    Future promptCreateCategory() => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoPopupSurface(
            child: Container(
              height: 400,
              color: CupertinoColors.white,
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Create Category',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CupertinoTextFormFieldRow(
                      decoration: const BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('Title'),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      placeholder: 'Enter Title here.',
                    )
                  ],
                ),
              ),
            ),
          ),
        );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 6.0),
          onPressed: () {
            promptCreateCategory();
          },
          child: (isEditing)
              ? const Icon(
                  CupertinoIcons.add,
                )
              : const SizedBox(),
        ),
        middle: const Text('Sleep Sounds'),
        trailing: CupertinoButton(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 6.0),
          onPressed: () {
            listProvider.toggleEditing();
          },
          child: (isEditing)
              ? const Text(
                  'Done',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Icon(CupertinoIcons.create),
        ),
      ),
      child: ListView.builder(
        itemCount: listProvider.countCategories.length,
        itemBuilder: (context, int index) {
          return listProvider.countCategories.elementAt(index);
        },
      ),
    );
  }
}
