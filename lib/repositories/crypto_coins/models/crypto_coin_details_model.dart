import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_details_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetailsModel extends Equatable {
  const CryptoCoinDetailsModel({
    required this.priceInUsd,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  @HiveField(0)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;
  @HiveField(1)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;
  @HiveField(2)
  @JsonKey(name: 'NIGH24HOUR')
  final double hight24Hour;
  @HiveField(3)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hours;
  @HiveField(4)
  @JsonKey(name: 'PRICE')
  final double priceInUsd;
  @HiveField(5)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  factory CryptoCoinDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCoinDetailsModelToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;
  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object> get props => [
    toSymbol,
    lastUpdate,
    hight24Hour,
    low24Hours,
    priceInUsd,
    imageUrl,
  ];
}
