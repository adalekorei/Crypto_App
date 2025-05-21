// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetailsModel _$CryptoCoinDetailsModelFromJson(
  Map<String, dynamic> json,
) => CryptoCoinDetailsModel(
  priceInUsd: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetailsModel._dateTimeFromJson(json['LASTUPDATE'] as int),
      hight24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
);

Map<String, dynamic> _$CryptoCoinDetailsModelToJson(
  CryptoCoinDetailsModel instance,
) => <String, dynamic>{
  'TOSYMBOL': instance.toSymbol,
  'LASTUPDATE': CryptoCoinDetailsModel._dateTimeToJson(instance.lastUpdate),
  'NIGH24HOUR': instance.hight24Hour,
  'LOW24HOUR': instance.low24Hours,
  'PRICE': instance.priceInUsd,
  'IMAGEURL': instance.imageUrl,
};
