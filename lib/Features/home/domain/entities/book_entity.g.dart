// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntityAdapter extends TypeAdapter<BookEntity> {
  @override
  final int typeId = 0;

  @override
  BookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntity(
      author: fields[1] as String?,
      averageRating: fields[3] as num?,
      image: fields[0] as String?,
      ratingCount: fields[4] as num?,
      title: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.averageRating)
      ..writeByte(4)
      ..write(obj.ratingCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}