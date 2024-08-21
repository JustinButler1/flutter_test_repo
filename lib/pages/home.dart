import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sound_counter/util/list_item_type.dart';

import '../providers/list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedListType = "Count Only";

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of<ListProvider>(context);
    bool isEditing = listProvider.isEditing;

    promptTypeSelection(CupertinoPicker picker) => showCupertinoModalPopup(
          context: context,
          builder: (context) => SizedBox(
            width: double.infinity,
            height: 250,
            child: picker,
          ),
        );

    promptCreateCategory() => showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoPopupSurface(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                TextEditingController _titleController =
                    TextEditingController();
                return Container(
                  height: 400,
                  color: CupertinoColors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.destructiveRed,
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                onPressed: () {
                                  String input = _titleController.text;
                                  if (input.isEmpty) {
                                    return;
                                  }
                                  listProvider.createCategory(
                                    input,
                                    selectedListType,
                                  );
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Create Category',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CupertinoTextFormFieldRow(
                          controller: _titleController,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          prefix: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              'Title:',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          placeholder: 'Enter Title here.',
                        ),
                        CupertinoFormRow(
                          prefix: const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              'Type:',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CupertinoButton(
                            onPressed: () => promptTypeSelection(
                              CupertinoPicker(
                                itemExtent: 30,
                                scrollController: FixedExtentScrollController(
                                  initialItem: 0,
                                ),
                                onSelectedItemChanged: (int value) {
                                  List<String> options =
                                      listItemTypesAsStrings();
                                  setModalState(() {
                                    selectedListType = options[value];
                                  });
                                },
                                children: listItemTypesAsStrings()
                                    .map((e) => Text(e))
                                    .toList(),
                              ),
                            ),
                            child: Text(
                              selectedListType,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
