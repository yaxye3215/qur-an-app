import 'dart:convert';

import 'package:quran_app/models/sutah/ayah_model.dart';
import 'package:http/http.dart' as http;

class AyahApi {
  Future<List<Ayah>> getAyahs(int surah) async {
    List<Ayah> ayahs = [];
    try {
      var response = await http.get(
          Uri.parse('https://api.alquran.cloud/v1/surah/$surah'),
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
