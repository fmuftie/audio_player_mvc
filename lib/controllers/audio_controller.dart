// lib/controllers/audio_controller.dart

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/audio_model.dart';
import '../services/audio_service.dart';

class AudioController extends ChangeNotifier {
  final AudioService audioService;
  List<AudioModel> audios = [];
  bool isLoading = false;
  String errorMessage = '';

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  AudioController({required this.audioService});

  Future<void> loadAudios() async {
    isLoading = true;
    //notifyListeners();

    try {
      audios = await audioService.fetchAudios();
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> playAudio(String filePath) async {
    try {
      await _audioPlayer.setAsset(filePath);
      _audioPlayer.play();
      isPlaying = true;
      notifyListeners();

      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          isPlaying = false;
          notifyListeners();
        }
      });
    } catch (e) {
      errorMessage = 'Gagal memutar audio.';
      notifyListeners();
    }
  }

  void pauseAudio() {
    _audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
