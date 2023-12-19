import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/sutah/ayah_model.dart';

class SurahTranslateApi {
  Future<List<Ayah>> getSurahTranslate(int surah) async {
    List<Ayah> ayahs = [];
    try {
      var response = await http.get(
          Uri.parse('https://api.alquran.cloud/v1/surah/$surah/so.abduh'),
          headers: {
            "Content-Type": "application/json",
          });
      if (response.statusCode == 200) {
        final resul = Ayahs.fromJson(jsonDecode(response.body)["data"]);
        ayahs = resul.ayahs;
      }
      return ayahs;
    } catch (e) {
      return [];
    }
  }
}
