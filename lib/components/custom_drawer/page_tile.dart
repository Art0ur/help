import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  //const PageTile({Key? key}) : super(key: key);

  const PageTile(
      {required this.label,
      required this.iconData,
      required this.onTap,
      required this.highlighted});
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: highlighted ? Colors.yellow : Colors.black,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.yellow : Colors.black,
      ),
      onTap: onTap,
    );
  }
}
