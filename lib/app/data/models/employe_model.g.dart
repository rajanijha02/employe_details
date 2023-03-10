// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeAdapter extends TypeAdapter<Employe> {
  @override
  final int typeId = 2;

  @override
  Employe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employe(
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      role: fields[3] as String,
      gender: fields[4] as String,
      oEmail: fields[5] as String,
      pEmail: fields[6] as String,
      mobile: fields[7] as String,
      aTMobNumber: fields[8] as String,
      waNumber: fields[9] as String,
      password: fields[10] as String,
      address: fields[11] as String,
      landMark: fields[12] as String,
      city: fields[13] as String,
      state: fields[14] as String,
      pincode: fields[15] as String,
      ctc: fields[16] as String,
      bankName: fields[17] as String,
      acNum: fields[18] as String,
      ifsc: fields[19] as String,
      panNumber: fields[20] as String,
      designation: fields[21] as String,
      workLocation: fields[22] as String,
      docs: (fields[23] as List).cast<Docs>(),
      id: fields[24] as String,
      empId: fields[25] as String,
      sN: fields[26] as String,
      createdAt: fields[27] as String,
      status: fields[28] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Employe obj) {
    writer
      ..writeByte(28)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.oEmail)
      ..writeByte(6)
      ..write(obj.pEmail)
      ..writeByte(7)
      ..write(obj.mobile)
      ..writeByte(8)
      ..write(obj.aTMobNumber)
      ..writeByte(9)
      ..write(obj.waNumber)
      ..writeByte(10)
      ..write(obj.password)
      ..writeByte(11)
      ..write(obj.address)
      ..writeByte(12)
      ..write(obj.landMark)
      ..writeByte(13)
      ..write(obj.city)
      ..writeByte(14)
      ..write(obj.state)
      ..writeByte(15)
      ..write(obj.pincode)
      ..writeByte(16)
      ..write(obj.ctc)
      ..writeByte(17)
      ..write(obj.bankName)
      ..writeByte(18)
      ..write(obj.acNum)
      ..writeByte(19)
      ..write(obj.ifsc)
      ..writeByte(20)
      ..write(obj.panNumber)
      ..writeByte(21)
      ..write(obj.designation)
      ..writeByte(22)
      ..write(obj.workLocation)
      ..writeByte(23)
      ..write(obj.docs)
      ..writeByte(24)
      ..write(obj.id)
      ..writeByte(25)
      ..write(obj.empId)
      ..writeByte(26)
      ..write(obj.sN)
      ..writeByte(27)
      ..write(obj.createdAt)
      ..writeByte(28)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
