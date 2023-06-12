import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_info.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CoinInfo extends Equatable {
  const CoinInfo({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  @HiveField(2)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  @HiveField(3)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;
   
  @HiveField(4)
  @JsonKey(name: 'HIGH24HOUR')
  final double hight24Hour;
  
  @HiveField(5)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;

  String get fullImageUrl => 'https://cryptocompare.com/$imageUrl';

  factory CoinInfo.fromJson(Map<String, dynamic> json) => _$CoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);

  static int _dateTimeToJson(DateTime time) => time.microsecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int ms) => DateTime.fromMillisecondsSinceEpoch(ms);

  @override
  List<Object?> get props => [
    priceInUSD,
    imageUrl,
    toSymbol,
    lastUpdate,
    hight24Hour,
    low24Hours,
  ];
} 