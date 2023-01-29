import 'package:decoffee/config/themes/app_themes.dart';
import 'package:decoffee/core/utils/app_strings.dart';
import 'package:decoffee/features/shop/presentation/cubits/drink%20detail%20cubit/drink_detail_cubit.dart';
import 'package:decoffee/features/shop/presentation/cubits/shop%20detail%20cubit/shop_detail_cubit.dart';
import 'package:decoffee/features/shop/presentation/screens/shop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeCoffeApp extends StatelessWidget {
  const DeCoffeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ShopDetailCubit>(
              create: (context) => ShopDetailCubit(),
            ),
            BlocProvider<DrinkDetailCubit>(
              create: (context) => DrinkDetailCubit(),
            ),
          ],
          child: MaterialApp(
            title: AppStrings.appTitle,
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            // onGenerateRoute: AppRoute.onGenerateRoute,
            home: const Directionality(
              textDirection: TextDirection.rtl,
              child: ShopDetailScreen(),
            ),
            // localizationsDelegates: [
            //          GlobalCupertinoLocalizations.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            //       ],
            //       supportedLocales:const <Locale>[
            //         Locale('ar', 'EG'),
            //       ],
            //       locale:const Locale('ar'),
          ),
        );
      },
      // child: QuoteScreen(),
    );
  }
}
