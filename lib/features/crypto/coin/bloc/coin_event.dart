part of 'coin_block.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinInfo extends CoinEvent {
  const LoadCoinInfo({ required this.currencyCode });

  final String currencyCode;
  
  @override
  List<Object> get props => super.props..add(currencyCode);
}