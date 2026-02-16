import 'package:accessories_store/features/home/data/models/product_model.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/item_product_list_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListGridWidget extends StatelessWidget {
  const ProductListGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedGrid(
      initialItemCount: 4,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: Tween(
            begin: Offset(0, 0.2),
            end: Offset.zero,
          ).animate(animation),
          child: ItemProductListGridWidget(productModel: products[index],),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.8,
      ),
    );
  }
}
