// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran_app/models/sutah/ayah_model.dart';

import '../../controller/surah/ayah_controller.dart';

class AyahsScreen extends StatelessWidget {
  AyahsScreen({
    Key? key,
    required this.ayahs,
    required this.translate,
    required this.surahName,
  }) : super(key: key);
  final List<Ayah> ayahs;
  final List<Ayah> translate;
  final String surahName;
  final AyahController ayahController = Get.put(AyahController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 184, 189),
      appBar: AppBar(
        backgroundColor: const Color(0xff22909D),
        title: Align(
          alignment: Alignment.topRight,
          child: Text(surahName),
        ),
        titleTextStyle: const TextStyle(fontSize: 30),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              final translateAyah = translate[index];
              return Wrap(
                alignment: WrapAlignment.end,
                spacing: 0,
                runSpacing: 0,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color.fromARGB(255, 171, 205, 221),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ayah.text,
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.right,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              translateAyah.text,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.right,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      ayahController
                                          .getAudio(ayah.number.toString());
                                    },
                                    icon: const Icon(Icons.play_arrow)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(ayahController
                                        .formatTime(ayahController.position)),
                                    Text(ayahController.formatTime(
                                        ayahController.duration -
                                            ayahController.position)),
                                  ],
                                ),
                                Slider(
                                  min: 0,
                                  max: ayahController.duration.inSeconds
                                      .toDouble(),
                                  value: ayahController.position.inSeconds
                                      .toDouble(),
                                  onChanged: (value) async {
                                    final position =
                                        Duration(seconds: value.toInt());
                                    await ayahController.audioPlayer
                                        .seek(position);
                                    //optional
                                    await ayahController.audioPlayer.resume();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/* ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: ayahs.length,
          itemBuilder: (BuildContext context, int index) {
          
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ayah.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ), */
