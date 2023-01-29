part of 'drink_detail_cubit.dart';

abstract class DrinkDetailState extends Equatable {
  const DrinkDetailState();

  @override
  List<Object> get props => [];
}

class DrinkDetailInitial extends DrinkDetailState {}

class ChangeSizeDrink extends DrinkDetailState {}
class DecreaseQuantaty extends DrinkDetailState {}
class IncreaseQuantaty extends DrinkDetailState {}
