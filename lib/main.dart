import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'crypto_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.info('Initialized firebase project with id: ${firebaseApp.options.projectId}');

  await Hive.initFlutter();
  Hive.registerAdapter(CoinAdapter());
  Hive.registerAdapter(CoinInfoAdapter());

  const coinsBoxName = 'coins_box';
  final coinsBox = await Hive.openBox<Coin>(coinsBoxName);

  final dio = Dio();

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker, 
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false, 
      printEventFullData: false,
    )
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CoinsRepository(dio: dio, coinsBox: coinsBox)
  );

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  PlatformDispatcher.instance.onError =(e, st) {
    GetIt.I<Talker>().handle(e, st);

    return true;
  };
  
  runZonedGuarded(
    () => runApp(const CryptoApp()),
    (e, st) => GetIt.I<Talker>().handle(e, st)
  );
}
