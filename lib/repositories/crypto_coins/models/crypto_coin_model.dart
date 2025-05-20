// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CryptoCoinModel extends Equatable {
  CryptoCoinModel({
    required this.name,
    required this.priceInUsd,
    required this.imageUrl,
  });

  final String name;
  final double priceInUsd;
  final String imageUrl;

  @override
  List<Object> get props => [name, priceInUsd, imageUrl];
}
