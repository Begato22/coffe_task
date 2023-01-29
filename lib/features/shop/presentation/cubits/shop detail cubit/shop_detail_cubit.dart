import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'shop_detail_state.dart';

class ShopDetailCubit extends Cubit<ShopDetailState> {
  ShopDetailCubit()
      : super(ShopDetailInitial());

  static ShopDetailCubit get(context) => BlocProvider.of(context);

  int currentCatgoryIndex = 0;
  void changeCategory(int index) {
    emit(ShopDetailInitial());
    currentCatgoryIndex = index;
    emit(ChangeCategory());
  }
}
