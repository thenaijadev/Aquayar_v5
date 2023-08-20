// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aquayar_auth_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AquayarAuthUserAdapter extends TypeAdapter<AquayarAuthUser> {
  @override
  final int typeId = 0;

  @override
  AquayarAuthUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AquayarAuthUser(
      authToken: fields[5] as String?,
      photoUrl: fields[7] as String?,
      address: fields[10] as String?,
      waterSize: fields[9] as int?,
      id: fields[0] as String?,
      phone: fields[4] as String?,
      displayName: fields[6] as String?,
      email: fields[1] as String?,
      isVerified: fields[2] as bool?,
      gender: fields[8] as String?,
      userType: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AquayarAuthUser obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.isVerified)
      ..writeByte(3)
      ..write(obj.userType)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.authToken)
      ..writeByte(6)
      ..write(obj.displayName)
      ..writeByte(7)
      ..write(obj.photoUrl)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.waterSize)
      ..writeByte(10)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AquayarAuthUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
