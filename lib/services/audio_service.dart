// lib/services/audio_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/audio_model.dart';

class AudioService {
  final String jsonPath;

  AudioService({required this.jsonPath});

  Future<List<AudioModel>> fetchAudios() async {
    try {
      final String response = await rootBundle.loadString(jsonPath);
      final List<dynamic> data = json.decode(response);
      return data.map((json) => AudioModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load audio data');
    }
  }
}
