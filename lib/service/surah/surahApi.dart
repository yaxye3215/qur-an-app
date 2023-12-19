import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/sutah/surahmodel.dart';

class SurahApi {
  List<Reference> surahs = [];
  Future<List<Reference>> getSurah() async {
    try {
      var response = await http
          .get(Uri.parse('https://api.alquran.cloud/v1/meta'), headers: {
        "Content-Type": "application/json",
      });

      // from json
      if (response.statusCode == 200) {
        final resul = SurahModel.fromJson(jsonDecode(response.body)["data"]);
        surahs = resul.surahs.references;
      }
      return surahs;
    } catch (e) {
      return [];
    }
    // to json
  }
}
