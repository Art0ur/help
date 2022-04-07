import 'package:flutter/material.dart';
import 'package:help/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  const PageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Colunmn(
      children: [
        PageTile(
          label: 'Anuncios',
          iconData: Icons.list,
          onTap:(){

          },
          highlighted: false
        )
      ]
    );
  }
}
