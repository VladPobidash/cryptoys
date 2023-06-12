part of 'coins_block.dart';

abstract class CoinsEvent extends Equatable {}

class LoadCoins extends CoinsEvent {
  LoadCoins({ this.completer});

  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}