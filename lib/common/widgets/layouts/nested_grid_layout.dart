import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TNestedGridLayout extends StatelessWidget {
  const TNestedGridLayout({
    super.key,
    required this.itemCount,
    required this.childAspectRatio,
    required this.itemBuilder,
  });

  final int itemCount;
  final double childAspectRatio;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        childAspectRatio: childAspectRatio,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
