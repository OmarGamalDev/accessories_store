import 'package:accessories_store/core/utils/app_colors.dart';
import 'package:accessories_store/features/home/data/models/product_model.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/item_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProductListGridWidget extends StatelessWidget {
  const ItemProductListGridWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
      decoration: BoxDecoration(
        color: AppColors.borderTextFieldColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: ItemProductWidget(productModel: productModel,),
    );
  }
}
