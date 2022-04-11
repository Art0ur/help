import 'package:flutter/material.dart';
import 'package:help/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  //const PageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncio',
          iconData: Icons.list,
          onTap:(){

          },
          highlighted: true,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap:(){

          },
          highlighted: false,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap:(){

          },
          highlighted: false,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap:(){

          },
          highlighted: false,
        ),
      ],
    );

  }
}
