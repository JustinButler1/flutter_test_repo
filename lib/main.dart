import 'package:flutter/cupertino.dart';

import 'pages/skeleton_page.dart';

void main() => runApp(const AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(context) {
    return const CupertinoApp(
      // theme: CupertinoThemeData(
      //   textTheme: CupertinoTextThemeData(textStyle: TextStyle(fontSize: 18)),
      // ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const SkeletonPage();
  }
}
