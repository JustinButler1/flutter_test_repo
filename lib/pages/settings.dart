import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Settings')),
        child: SafeArea(
          child: CupertinoFormSection(
              header: const Text('Appearance'),
              children: <Widget>[
                CupertinoFormRow(
                  prefix: const Text('Dark Mode'),
                  child: CupertinoSwitch(
                    value: isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ),
                CupertinoTextFormFieldRow(
                    prefix: const Text('App Title'),
                    placeholder: 'Enter Title'),
              ]),
        ));
  }
}
