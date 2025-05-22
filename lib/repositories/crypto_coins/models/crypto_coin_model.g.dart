// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinModelAdapter extends TypeAdapter<CryptoCoinModel> {
  @override
  final int typeId = 2;

  @override
  CryptoCoinModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinModel(
      name: fields[0] as String,
      details: fields[1] as CryptoCoinDetailsModel,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
