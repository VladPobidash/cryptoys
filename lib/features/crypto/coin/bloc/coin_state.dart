part of 'coin_block.dart';

class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object?> get props => [];
}


class CoinInfoLoading extends CoinState {
  const CoinInfoLoading();
}

class CoinInfoLoaded extends CoinState {
  const CoinInfoLoaded(this.coin); 

  final Coin coin;

  @override
  List<Object?> get props => [coin];
}

class CoinInfoLoadingFailure extends CoinState {
  const CoinInfoLoadingFailure(this.exception); 

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}