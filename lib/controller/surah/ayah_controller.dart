import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import 'package:quran_app/models/sutah/ayah_model.dart';
import 'package:quran_app/service/surah/ayahApi.dart';
import 'package:quran_app/service/surah/surah_translate.dart';

class AyahController extends GetxController {
  RxList<Ayah> ayahs = <Ayah>[].obs;
  RxList<Ayah> translatedAyah = <Ayah>[].obs;
  final audioPlayer = AudioPlayer();
  bool isPlay = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    var date = duration.toString().split(":");
    var hrs = date[0];
    var mns = date[1];
    var sds = date[2].split(".")[0];
    return "$hrs:$mns:$sds";
  }

  Future<void> getAyah(int surah) async {
    ayahs.value = await AyahApi().getAyahs(surah);
  }

  Future<void> getAyahTranslate(int surah) async {
    translatedAyah.value = await SurahTranslateApi().getSurahTranslate(surah);
  }

  Future<void> getAudio(String number) async {
    try {
      final player = AudioPlayer();
      await player.play(UrlSource(
          'https://cdn.islamic.network/quran/audio/128/ar.alafasy/$number.mp3'));

      audioPlayer.onPlayerStateChanged.listen((state) {
        isPlay = state == PlayerState.playing;
      });
      // listen to audio duration
      audioPlayer.onDurationChanged.listen((newDuration) {
        duration = newDuration;
      });

      // listen to audio position
      audioPlayer.onPositionChanged.listen((newPosition) {
        position = newPosition;
      });
    } catch (e) {
      print(e);
    }
  }
}
