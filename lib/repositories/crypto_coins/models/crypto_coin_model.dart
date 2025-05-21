// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_details_model.dart';
import 'package:equatable/equatable.dart';

class CryptoCoinModel extends Equatable {
  CryptoCoinModel({
    required this.name,
    required this.details,
  });

  final String name;
  final CryptoCoinDetailsModel details;
  @override
  List<Object> get props => [name, details];
}
