import 'package:flutter/material.dart';
import 'package:help/components/custom_drawer/custom_drawer.dart';
import 'package:help/screens/home/components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    openSearch(BuildContext context) async {
      showDialog(
          context: context,
          builder: (_) => SearchDialog(
                currentSearch: '',
              ));
    }

    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                openSearch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
