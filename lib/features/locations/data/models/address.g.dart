// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 1;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      name: fields[1] as String,
      address: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
