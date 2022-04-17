import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:help/stores/page_store.dart';
import 'package:mobx/mobx.dart';
import '../home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //const BaseScreen({Key? key}) : super(key: key);

  //Tenho que observar o observable page do page_store e sempre que ele mudar eu devo fazer algo no meu PageController.
  // Fazer isso utilizando a reaction do page_store
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    super.initState();

    //reation observa pageStore.page
    reaction(
            (_) => pageStore.page,                                              //Sempre que houver uma modificacao no page do meu pageStore, ele vai  chamar a funcao de baixo
                                                                                // passando a pagina atual e chamando o jumpToPage(page), passando o numero da pagina atual.
            (page) => pageController.jumpToPage(page)                           //Rever porque nao esta reconhendo o page do jumpToPage
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
          //Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.yellow,),
          Container(color: Colors.purple,),
          Container(color: Colors.brown,),
        ],
      ),

    );
  }
}
