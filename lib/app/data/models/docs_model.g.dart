// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocsAdapter extends TypeAdapter<Docs> {
  @override
  final int typeId = 3;

  @override
  Docs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Docs(
      title: fields[0] as String,
      docsName: fields[1] as String,
      path: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Docs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.docsName)
      ..writeByte(2)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
