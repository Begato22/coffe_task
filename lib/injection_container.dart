import 'package:decoffee/core/network/network_info.dart';
import 'package:get_it/get_it.dart';




final sl = GetIt.instance;

Future<void> init() async {
  //Featchers
  //Blocs


  //Use Cases


  //Repositories


  //Data Sources

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));

  //External


}
