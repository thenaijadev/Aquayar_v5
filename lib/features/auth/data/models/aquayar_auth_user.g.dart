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
      waterSize: fields[9] as double?,
      id: fields[0] as String?,
      countryCode: fields[15] as String?,
      city: fields[11] as String?,
      addressName: fields[12] as String?,
      latitude: fields[14] as double?,
      longitude: fields[13] as double?,
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
      ..writeByte(16)
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
      ..write(obj.address)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.addressName)
      ..writeByte(13)
      ..write(obj.longitude)
      ..writeByte(14)
      ..write(obj.latitude)
      ..writeByte(15)
      ..write(obj.countryCode);
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
