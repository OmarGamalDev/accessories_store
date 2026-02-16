import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/core/utils/app_text_style.dart';
import 'package:accessories_store/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemProductWidget extends StatelessWidget {
  const ItemProductWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            productModel.image,
            width: 114.w,
            height: 105.h,
            fit: BoxFit.cover,
          ),
        ),
        CustomHeightSpacingWidget(height: 24),
        Text(productModel.title, style: AppTextStyle.blackW600S13),
        CustomHeightSpacingWidget(height: 4),
        Text("\$${productModel.price} Pound / Kilo", style: AppTextStyle.orangeW700S13),
      ],
    );
  }
}
