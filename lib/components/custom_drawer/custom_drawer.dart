import 'package:flutter/material.dart';
import 'package:help/components/custom_drawer/page_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,                           //Nao esta funcionando
      child: Drawer(
        child: ListView(
          children: const [
            PageSection()
          ],
        ),

      ),
    );
  }
}
