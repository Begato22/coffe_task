import 'package:decoffee/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class IncreaseAndDecrease extends StatelessWidget {
  const IncreaseAndDecrease({
    Key? key,
    required this.increaseFunc,
    required this.decreaseFunc,
    required this.quantatiy,
    this.size = 40,
  }) : super(key: key);

  final Function increaseFunc;
  final Function decreaseFunc;
  final int quantatiy;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            decreaseFunc();
          },
          child: Container(
            height: (size - 10).w,
            width: size.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 2),
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
            ),
            child: Icon(
              Icons.remove,
              color: AppColors.primaryColor,
              size: size / 2,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              '$quantatiy',
              style: TextStyle(
                  color: AppColors.secondryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: (size / 2).sp),
            )),
        InkWell(
          onTap: () {
            increaseFunc();
          },
          child: Container(
            height: (size - 10).w,
            width: size.w,
            decoration: const BoxDecoration(
              color: AppColors.primarySwatch,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(20),
              ),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: size / 2,
            ),
          ),
        ),
      ],
    );
  }
}
