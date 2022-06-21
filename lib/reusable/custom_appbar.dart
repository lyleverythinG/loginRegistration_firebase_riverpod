import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final PreferredSizeWidget? bottom;
  final String? titleText;
  final Widget? leadingIcon;
  final void Function()? onPressed;
  CustomAppBar(
      {this.bottom,
      this.title,
      this.titleText,
      this.onPressed,
      this.leadingIcon});
  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText!,
      ),
      centerTitle: true,
      elevation: 1,
      leading: leadingIcon,
    );
  }
}
