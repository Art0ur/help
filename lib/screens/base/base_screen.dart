import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:help/screens/create/create_screen.dart';
import 'package:help/stores/page_store.dart';
import 'package:mobx/mobx.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //const BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    //reation observa pageStore.page
    reaction(
            (_) => pageStore.page,

            (page) => pageController.jumpToPage(pageStore.page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),                            //https://api.flutter.dev/flutter/widgets/NeverScrollableScrollPhysics-class.html
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
          Container(color: Colors.purple,),
          Container(color: Colors.brown,),
        ],
      ),

    );
  }
}
