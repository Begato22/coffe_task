import 'package:decoffee/core/utils/app_assets.dart';
import 'package:decoffee/core/utils/app_colors.dart';
import 'package:decoffee/features/shop/presentation/cubits/shop%20detail%20cubit/shop_detail_cubit.dart';
import 'package:decoffee/features/shop/presentation/widgets/bottom_sheet_holder.dart';
import 'package:decoffee/features/shop/presentation/widgets/grid_item.dart';
import 'package:decoffee/features/shop/presentation/widgets/increase_decrease.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                )),
                builder: (context) {
                  return showBasketBottomSheet(context);
                },
              );
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130.h,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: AppColors.lightPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ستاربكس',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Container(
                              height: 10.w,
                              width: 10.w,
                              margin: EdgeInsets.symmetric(horizontal: 7.w),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              'مفتوح',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                        buildShopInfoRow(
                            'على بعد 1 كم', Icons.location_on_outlined),
                        buildShopInfoRow(
                            'الوصول في خلال 20 د', Icons.av_timer_outlined),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50.w,
                    top: 0.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 90.w,
                          width: 90.w,
                          child: Image.asset(AppAssets.starbucks),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 40.h,
              padding: EdgeInsets.only(right: 15.w),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildCategoryOption(index),
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: 7,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 140 * 6.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const GridItem(
                    imagePath: AppAssets.starbucksDrink,
                    name: 'لاتيه',
                    price: 10,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 15.w,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container showBasketBottomSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHolder(),
          Container(
            height: 0.8.sh,
            margin: EdgeInsets.only(top: 20.h),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    IncreaseAndDecrease(
                      increaseFunc: () {},
                      decreaseFunc: () {},
                      quantatiy: 2,
                      size: 30,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'لاتيه',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              'مشروب ساخن',
                              style: TextStyle(fontSize: 10.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  'ر.س',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  '10',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset(
                          AppAssets.starbucksDrink,
                          height: 70.w,
                          width: 70.w,
                          fit: BoxFit.contain,
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      'ر.س',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '30',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
                const Spacer(),
                const Text('اجمالي')
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text(' شراء الان '))
        ],
      ),
    );
  }

  Widget buildCategoryOption(int index) {
    return BlocBuilder<ShopDetailCubit, ShopDetailState>(
      builder: (context, state) {
        var cubit = ShopDetailCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.changeCategory(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: cubit.currentCatgoryIndex == index
                  ? AppColors.primaryColor
                  : AppColors.lightPrimaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'قسم ${index + 1} ',
              style: TextStyle(
                color: cubit.currentCatgoryIndex == index
                    ? Colors.white
                    : AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildShopInfoRow(String txt, IconData iconData) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.grey,
          size: 16.sp,
        ),
        SizedBox(width: 5.w),
        Text(
          txt,
          style: TextStyle(
              color: Colors.grey, fontSize: 11.sp, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
