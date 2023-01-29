import 'package:decoffee/features/shop/presentation/cubits/shop%20detail%20cubit/shop_detail_cubit.dart';
import 'package:decoffee/features/shop/presentation/screens/shop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Routes {
  static const String initialRoute = '/';
  static const String shopRote = '/shopRote';
}

class AppRoute {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ShopDetailCubit>(
            create: (context) => ShopDetailCubit(),
            child: const ShopDetailScreen(),
          ),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            'undefined Page :{',
          ),
        ),
      ),
    );
  }
}
