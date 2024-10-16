// lib/models/audio_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'audio_model.g.dart';

@JsonSerializable()
class AudioModel {
  final String id;
  final String title;
  final String file;

  AudioModel({
    required this.id,
    required this.title,
    required this.file,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}
