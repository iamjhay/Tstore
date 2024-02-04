import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/home/widget/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widget/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widget/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/layouts/nested_grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// --Category
                        THomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// Body
            Column(
              children: [
                /// Promo Slider
                const TPromoSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3,
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Popular Product
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Heading
                      const TSectionHeading(
                        title: 'Popular Products',
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Promo Slider
                      TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => const TProductCardVertical(),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Heading
                      const TSectionHeading(
                        title: 'New Products',
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// Test Nested Widget
                      SizedBox(
                        height: 250,
                        child: TNestedGridLayout(
                          itemCount: 10,
                          childAspectRatio: 6 / 16,
                          itemBuilder: (_, index) {
                            return Container(
                              color: Colors.blue,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
