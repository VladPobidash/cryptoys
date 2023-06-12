import 'package:crypto_coins_list/repositories/crypto/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'coin.g.dart';

@HiveType(typeId: 2)
class Coin extends Equatable {
  const Coin({
    required this.name,
    required this.info,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final CoinInfo info;

  @override
  List<Object?> get props => [name, info];
} 