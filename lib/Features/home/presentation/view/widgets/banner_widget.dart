import 'package:accessories_store/features/home/data/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required this.bannerModel});
  final BannerModel bannerModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            width: double.infinity,
            bannerModel.image,
            fit: BoxFit.fill,
          ),
        );
  }
}