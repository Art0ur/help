import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  //const PageTile({Key? key}) : super(key: key);

  PageTile({this.label, this.iconData, this.onTap, this.highligthed});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highligthed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label
        ),
      leading: Icon(
        iconData
      ),
      onTap: onTap,
      );
  }
}
