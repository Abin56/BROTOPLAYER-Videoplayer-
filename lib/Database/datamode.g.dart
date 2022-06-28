// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DbVideplayerAdapter extends TypeAdapter<DbVideplayer> {
  @override
  final int typeId = 1;

  @override
  DbVideplayer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DbVideplayer(
      videoPath: fields[0] as String?,
      videoName: fields[1] as String?,
      folderPath: fields[2] as String,
      thumbnail: fields[3] as String,
      isFav: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DbVideplayer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.videoPath)
      ..writeByte(1)
      ..write(obj.videoName)
      ..writeByte(2)
      ..write(obj.folderPath)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbVideplayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SecDataBaseAdapter extends TypeAdapter<SecDataBase> {
  @override
  final int typeId = 2;

  @override
  SecDataBase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SecDataBase(
      favVideo: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SecDataBase obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.favVideo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecDataBaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaylistModelAdapter extends TypeAdapter<PlaylistModel> {
  @override
  final int typeId = 3;

  @override
  PlaylistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistModel(
      addplaylist: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.addplaylist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class videoplaylistmodeAdapter extends TypeAdapter<videoplaylistmode> {
  @override
  final int typeId = 4;

  @override
  videoplaylistmode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return videoplaylistmode(
      PLvideopath: fields[0] as String,
      playfolderlistname: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, videoplaylistmode obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.PLvideopath)
      ..writeByte(1)
      ..write(obj.playfolderlistname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is videoplaylistmodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentlistingmodeAdapter extends TypeAdapter<Recentlistingmode> {
  @override
  final int typeId = 6;

  @override
  Recentlistingmode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recentlistingmode(
      recentpath: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Recentlistingmode obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentpath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentlistingmodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
