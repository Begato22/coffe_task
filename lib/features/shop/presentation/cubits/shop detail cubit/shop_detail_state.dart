part of 'shop_detail_cubit.dart';

abstract class ShopDetailState extends Equatable {
  const ShopDetailState();

  @override
  List<Object> get props => [];
}

class ShopDetailInitial extends ShopDetailState {}

class ChangeCategory extends ShopDetailState {}
