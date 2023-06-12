part of 'coins_block.dart';

abstract class CoinsState extends Equatable {}

class CoinsInitial extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoading extends CoinsState {
  @override
  List<Object?> get props => [];
}

class CoinsLoaded extends CoinsState {
  CoinsLoaded({ required this.coins }); 

  final List<Coin> coins;

  @override
  List<Object?> get props => [coins];
}

class CoinsLoadingFailure extends CoinsState {
  CoinsLoadingFailure({ required this.exception }); 

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}