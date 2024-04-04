// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todomodelAdapter extends TypeAdapter<todomodel> {
  @override
  final int typeId = 1;

  @override
  todomodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todomodel(
      title: fields[0] as String?,
      iscompleted: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, todomodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.iscompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todomodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
