import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;

  const AppBarCustom({super.key, required this.title, required this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(60.2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)),
      ),
      elevation: 0.00,
      backgroundColor: const Color.fromARGB(255, 6, 14, 29),
    );
  }
}
