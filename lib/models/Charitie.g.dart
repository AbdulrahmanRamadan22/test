// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Charitie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharitieAdapter extends TypeAdapter<Charitie> {
  @override
  final int typeId = 0;

  @override
  Charitie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Charitie(
      name: fields[0] as String,
      phoneNum: fields[1] as String,
      instapay: fields[2] as String,
      bankAccount: fields[3] as String,
      hotline: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Charitie obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNum)
      ..writeByte(2)
      ..write(obj.instapay)
      ..writeByte(3)
      ..write(obj.bankAccount)
      ..writeByte(4)
      ..write(obj.hotline)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharitieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
