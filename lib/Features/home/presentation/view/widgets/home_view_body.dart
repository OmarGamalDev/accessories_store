import 'package:accessories_store/core/shared_widgets/custom_spacing_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/best_sells_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/home_app_bar_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/indicator_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/product_list_grid_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/search_widget.dart';
import 'package:accessories_store/features/home/presentation/view/widgets/slider_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomHeightSpacingWidget(height: 30),
            HomeAppBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomHeightSpacingWidget(height: 24),
                  ),
                  SliverToBoxAdapter(child: SearchWidget()),
                  SliverToBoxAdapter(
                    child: CustomHeightSpacingWidget(height: 12),
                  ),
                  SliverToBoxAdapter(
                    child: SliderBannerWidget(
                      initialPage: currentIndex,
                      onPageChanged: (index, realIndex) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomHeightSpacingWidget(height: 12),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: IndicatorWidget(currentIndex: currentIndex),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomHeightSpacingWidget(height: 12),
                  ),
                  SliverToBoxAdapter(
                    child: BestSellsWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: CustomHeightSpacingWidget(height: 8),
                  ),
                  ProductListGridWidget(),
                  SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
