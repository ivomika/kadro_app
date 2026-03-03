import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  const SliverDivider({
    super.key,
    this.margin = EdgeInsets.zero
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: margin,
      sliver: SliverToBoxAdapter(child: Divider()),
    );
  }
}
