import 'package:flutter/material.dart';
import 'package:help/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  //const BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.purple),
          Container(color: Colors.brown),

        ],
      ),

    );
  }
}
