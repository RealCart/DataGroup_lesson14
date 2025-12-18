import 'dart:convert';

import 'package:lesson14/data/character_model.dart';
import 'package:http/http.dart' as http;

class ListController {
  static Future<List<CharacterModel>> getCharacters() async {
    final response = await http.get(
      Uri.parse("https://rickandmortyapi.com/api/character"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      final List<dynamic> result = json['results'];

      return result.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed request');
    }
  }
}
