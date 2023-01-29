import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'drink_detail_state.dart';

class DrinkDetailCubit extends Cubit<DrinkDetailState> {
  DrinkDetailCubit() : super(DrinkDetailInitial());

  static DrinkDetailCubit get(context) => BlocProvider.of(context);

  int currentSizeIndex = 0;
  int quantatiy = 0;
  void changeDrinkSize(int index) {
    emit(DrinkDetailInitial());
    currentSizeIndex = index;
    emit(ChangeSizeDrink());
  }

   increaseQuantaty() {
    emit(DrinkDetailInitial());
    quantatiy++;
    emit(IncreaseQuantaty());
  }

   decreaseQuantaty() {
    emit(DrinkDetailInitial());
    if (quantatiy != 0) {
      quantatiy--;
      emit(DecreaseQuantaty());
    }
  }
}
