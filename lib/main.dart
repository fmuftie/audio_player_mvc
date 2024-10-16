// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/audio_controller.dart';
import 'services/audio_service.dart';
import 'views/audio_list_page.dart';

void main() {
  // Setup dependencies
  final audioService = AudioService(jsonPath: 'assets/data/audio_data.json');

  runApp(MyApp(audioService: audioService));
}

class MyApp extends StatelessWidget {
  final AudioService audioService;

  const MyApp({super.key, required this.audioService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AudioController>(
      create: (_) => AudioController(audioService: audioService),
      child: MaterialApp(
        title: 'Audio Player MVC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AudioListPage(),
      ),
    );
  }
}
