// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'crypto_coin_model.g.dart';

@HiveType(typeId: 2)
class CryptoCoinModel extends Equatable {
  const CryptoCoinModel({required this.name, required this.details});

  @HiveField(0)
  final String name;
  @HiveField(1)
  final CryptoCoinDetailsModel details;
  @override
  List<Object> get props => [name, details];
}
