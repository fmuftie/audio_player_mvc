// lib/views/audio_detail_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/audio_controller.dart';
import '../models/audio_model.dart';

class AudioDetailPage extends StatelessWidget {
  final AudioModel audio;

  const AudioDetailPage({super.key, required this.audio});

  @override
  Widget build(BuildContext context) {
    final audioController = Provider.of<AudioController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(audio.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(audio.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 64,
              icon: Icon(
                audioController.isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
              ),
              onPressed: () {
                if (audioController.isPlaying) {
                  audioController.pauseAudio();
                } else {
                  audioController.playAudio('assets/audio/${audio.file}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
