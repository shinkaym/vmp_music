// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicModelAdapter extends TypeAdapter<MusicModel> {
  @override
  final int typeId = 0;

  @override
  MusicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicModel(
      id: fields[0] as String,
      title: fields[1] as String,
      artist: fields[2] as String,
      album: fields[3] as String,
      filePath: fields[4] as String,
      duration: fields[5] as int,
      dateAdded: fields[6] as int,
      fileSize: fields[7] as int,
      format: fields[8] as String,
      albumArtPath: fields[9] as String,
      isFavorite: fields[10] as bool,
      playCount: fields[11] as int,
      lastPlayedAt: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MusicModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.artist)
      ..writeByte(3)
      ..write(obj.album)
      ..writeByte(4)
      ..write(obj.filePath)
      ..writeByte(5)
      ..write(obj.duration)
      ..writeByte(6)
      ..write(obj.dateAdded)
      ..writeByte(7)
      ..write(obj.fileSize)
      ..writeByte(8)
      ..write(obj.format)
      ..writeByte(9)
      ..write(obj.albumArtPath)
      ..writeByte(10)
      ..write(obj.isFavorite)
      ..writeByte(11)
      ..write(obj.playCount)
      ..writeByte(12)
      ..write(obj.lastPlayedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
