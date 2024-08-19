import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'pages/skeleton_page.dart';
import 'providers/list_provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ListProvider(),
        child: const AppWidget(),
      ),
    );

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
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
