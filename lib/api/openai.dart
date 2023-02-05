import 'dart:convert';

import 'package:chatty/private/keys.dart';
import 'package:http/http.dart' as http;

class OpenAi {
  static Future<String> completion(String content) async {
    try {
      Uri uri = Uri.https("api.openai.com", "/v1/completions");
      var response = await http.post(uri,
          headers: {
            "Authorization":
                "Bearer $apiKey",//Replace with apiKey
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode({
            "model": "text-davinci-003",
            "prompt": content,
            "max_tokens": 2046
          }));

      if (response.statusCode == 200) {
        Map<String, dynamic> map =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        String content = map["choices"][0]["text"] as String;
        return content.trim();
      }
    } catch (ex) {
      print("");
    }
    return "Je ne peux pas répondre maintenant";
  }
}
