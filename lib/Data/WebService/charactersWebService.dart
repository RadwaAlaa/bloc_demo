import 'dart:convert';
import 'package:bloc_demo/Data/Model/characterModel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CharactersWebService {
  Future<List<Character>> getAllCharacters() async {
    final response = await http
        .get(Uri.parse('https://breakingbadapi.com/api/characters'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    List<Character> charactersResponse = <Character>[];

    if (response.statusCode == 200) {
      // print(await response..bytesToString());
      List<dynamic> charactersDyn;
      charactersDyn = jsonDecode(response.body);
      charactersDyn.forEach((element) {
        charactersResponse.add(Character.fromJson(element));
      });

      print(charactersResponse.length.toString());
      return charactersResponse;
    } else {
      print(response.reasonPhrase);
      return charactersResponse;
    }
  }
}
