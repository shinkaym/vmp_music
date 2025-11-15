// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueueModelAdapter extends TypeAdapter<QueueModel> {
  @override
  final int typeId = 2;

  @override
  QueueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueueModel(
      musicIds: (fields[0] as List).cast<String>(),
      currentPosition: fields[1] as int,
      playbackPosition: fields[2] as int,
      isShuffleEnabled: fields[3] as bool,
      repeatMode: fields[4] as int,
      lastUpdatedAt: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QueueModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.musicIds)
      ..writeByte(1)
      ..write(obj.currentPosition)
      ..writeByte(2)
      ..write(obj.playbackPosition)
      ..writeByte(3)
      ..write(obj.isShuffleEnabled)
      ..writeByte(4)
      ..write(obj.repeatMode)
      ..writeByte(5)
      ..write(obj.lastUpdatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
