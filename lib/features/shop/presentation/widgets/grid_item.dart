import 'package:decoffee/core/utils/app_assets.dart';
import 'package:decoffee/core/utils/app_colors.dart';
import 'package:decoffee/features/shop/presentation/cubits/drink%20detail%20cubit/drink_detail_cubit.dart';
import 'package:decoffee/features/shop/presentation/widgets/bottom_sheet_holder.dart';
import 'package:decoffee/features/shop/presentation/widgets/increase_decrease.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class GridItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final int price;
  const GridItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          )),
          isScrollControlled: true,
          builder: (context) {
            return BlocBuilder<DrinkDetailCubit, DrinkDetailState>(
                builder: (context, state) {
              var cubit = DrinkDetailCubit.get(context);
              return buildDrinkInfo(cubit, context);
            });
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 2,
                child: Image.asset(
                  AppAssets.starbucksDrink,
                  fit: BoxFit.contain,
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Divider(
                      thickness: 2,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'لاتيه',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  '10',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  'س.ر',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.yellow,
                              size: 16.sp,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDrinkInfo(DrinkDetailCubit cubit, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const BottomSheetHolder(),
          Center(
            child: Container(
              height: 200.h,
              width: 0.7.sw,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            children: [
              IncreaseAndDecrease(
                increaseFunc: () => cubit.increaseQuantaty(),
                decreaseFunc: () => cubit.decreaseQuantaty(),
                quantatiy: cubit.quantatiy,
              ),
              const Spacer(),
              Text(
                name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: const Text(
              'شرح مفصل لمحتوى المشروب بكل تفاصيل المكونات الرئيسية',
              textDirection: TextDirection.rtl,
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 40.w,
                width: 140.w,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildDrinkSize(index),
                  separatorBuilder: (context, index) => SizedBox(width: 7.w),
                  itemCount: 3,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'ر.س',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '$price',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h),
            child: Text(
              'اضافات',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 130.h,
            child: ListView.separated(
              itemBuilder: (context, index) => Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'ر.س',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '2',
                        style: Theme.of(context).textTheme.headline2,
                      )
                    ],
                  ),
                  const Spacer(),
                  Text('اضافة ${index + 1}')
                ],
              ),
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
                      '$price',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
                const Spacer(),
                const Text('اجمالي')
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('اضافة الى السلة'))
        ],
      ),
    );
  }

  Widget buildDrinkSize(int index) {
    List<String> sizes = ['S', 'M', 'L'];
    return BlocBuilder<DrinkDetailCubit, DrinkDetailState>(
      builder: (context, state) {
        var cubit = DrinkDetailCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.changeDrinkSize(index);
          },
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
                color: cubit.currentSizeIndex == index
                    ? AppColors.primaryColor
                    : AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: Center(
              child: Text(
                sizes[index],
                style: TextStyle(
                    fontSize: 24 * (index + 1) / 3,
                    color: cubit.currentSizeIndex == index
                        ? Colors.white
                        : AppColors.primaryColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
