import 'package:flutter/material.dart';
import '../foundation/color.dart';
import '../foundation/typography.dart';
import '../foundation/spacing.dart';

/// AppBarMV - Molecule app bar component
///
/// A customizable app bar with title, actions, and leading widget.
/// Follows atomic design principles as a molecule combining multiple atoms.
class AppBarMV extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final double elevation;
  final PreferredSizeWidget? bottom;

  const AppBarMV({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = false,
    this.elevation = 0,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TopTypography.titleLarge.copyWith(
          color: titleColor ?? TopColor.gray900,
        ),
      ),
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      bottom: bottom,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: titleColor ?? TopColor.gray900,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
      );
}
