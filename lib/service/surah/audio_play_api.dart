import 'package:http/http.dart' as http;

class AudioPlayAPi {
  Future<void> getAudio(int number) async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://cdn.islamic.network/quran/audio/128/ar.alafasy/$number.mp3'),
      );

      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
