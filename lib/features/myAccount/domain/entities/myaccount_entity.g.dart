// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myaccount_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountEntityAdapter extends TypeAdapter<MyAccountEntity> {
  @override
  final int typeId = 0;

  @override
  MyAccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyAccountEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      username: fields[2] as String,
      password: fields[3] as String,
      category: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyAccountEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
