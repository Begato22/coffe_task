import 'package:decoffee/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomSheetHolder extends StatelessWidget {
  const BottomSheetHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.3.sw,
        height: 2.h,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        color: AppColors.primarySwatch,
      ),
    );
  }
}