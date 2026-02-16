import 'package:accessories_store/features/home/data/models/banner_model.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/banner_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderBannerWidget extends StatelessWidget {
  const SliderBannerWidget({super.key, this.onPageChanged, required this.initialPage});
  final int initialPage;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        return BannerWidget(bannerModel: banners[index]);
      },
      options: CarouselOptions(
        height: 158.h,
        aspectRatio: 16 / 9,
        viewportFraction: 1, // ياخد قد اي من عرض الشاشه واحد معناه ياخد العرض كله
        initialPage: initialPage,
        // enableInfiniteScroll: true,
        // reverse: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 600),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
