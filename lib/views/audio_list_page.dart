// lib/views/audio_list_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/audio_controller.dart';
import 'audio_detail_page.dart';

class AudioListPage extends StatefulWidget {
  const AudioListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AudioListPageState createState() => _AudioListPageState();
}

class _AudioListPageState extends State<AudioListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AudioController>(context, listen: false).loadAudios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Audio'),
      ),
      body: Consumer<AudioController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage));
          }

          return ListView.builder(
            itemCount: controller.audios.length,
            itemBuilder: (context, index) {
              final audio = controller.audios[index];
              return ListTile(
                title: Text(audio.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AudioDetailPage(audio: audio),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
