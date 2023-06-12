import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'coins_event.dart';
part 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc(this.coinsRepository) : super(CoinsInitial()) {
    on<LoadCoins>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(LoadCoins event, Emitter<CoinsState> emit) async {
    try {
      if (state is! CoinsLoaded) {
        emit(CoinsLoading());
      }

      emit(CoinsLoaded(coins: await coinsRepository.getCoins()));
    } catch (e, st) {
      emit(CoinsLoadingFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }
}
