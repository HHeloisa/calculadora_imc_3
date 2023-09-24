import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.title, super.key});

  final String? title;

  final double height = 60.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      centerTitle: true,
      actions: [
        IconButton(
            iconSize: 30,
            onPressed: () => Navigator.pushNamed(context, '/about'),
            icon: const Icon(Icons.info_outline_rounded))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
