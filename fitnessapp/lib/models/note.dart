import 'package:flutter/material.dart';

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, number, title, time
  ];

  static final String id = '_id';

  static final String number = 'number';
  static final String title = 'title';

  static final String time = 'time';
}

class Note {
  final int? id;

  final number;
  final String? title;

  final DateTime? createdTime;

  const Note({
    this.id,
    @required this.number,
    @required this.title,
    @required this.createdTime,
  });

  Note copy({
    int? id,
    int? number,
    String? title,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id!,
        NoteFields.title: title!,
        NoteFields.number: number!,
        NoteFields.time: createdTime!.toIso8601String(),
      };
}
