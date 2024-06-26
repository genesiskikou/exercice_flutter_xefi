// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recette.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecetteAdapter extends TypeAdapter<Recette> {
  @override
  final int typeId = 0;

  @override
  Recette read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recette(
      name: fields[0] as String,
      recette: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Recette obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.recette)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecetteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
