import 'package:flutter/material.dart';
import 'package:lupus_app/core/shared_widgets/arrow_left_leading.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double elevation;

  const CustomAppBar({
    super.key,
    this.title = "", // Default title from your snippet
    this.leading,
    this.actions,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          height: 1.0,
          color: Colors.black,
          letterSpacing: 16 * 0.015,
        ),
      ),
      leading: leading ?? const ArrowLeftLeading(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
