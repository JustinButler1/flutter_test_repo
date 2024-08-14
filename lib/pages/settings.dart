import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'), trailing: Icon(CupertinoIcons.create)),
      child: Center(child: Text('Goodbye, World!')),
    );
  }
}
