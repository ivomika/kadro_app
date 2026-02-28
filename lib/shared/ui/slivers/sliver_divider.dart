import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const SliverDivider({
    super.key,
    this.padding = EdgeInsets.zero
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(child: Divider()),
    );
  }
}
