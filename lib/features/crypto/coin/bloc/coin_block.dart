import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(this.coinsRepository) : super(const CoinState()) {
    on<LoadCoinInfo>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCoinInfo event,
    Emitter<CoinState> emit,
  ) async {
    try {
      if (state is! CoinInfoLoaded) {
        emit(const CoinInfoLoading());
      }

      emit(CoinInfoLoaded(await coinsRepository.getCoinInfo(event.currencyCode)));
    } catch (e, st) {
      emit(CoinInfoLoadingFailure(e));
      GetIt.I<Talker>().handle(e, st);
    }
  }
}
