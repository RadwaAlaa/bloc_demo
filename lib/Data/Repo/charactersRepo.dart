import 'package:bloc_demo/Data/Model/characterModel.dart';
import 'package:bloc_demo/Data/WebService/charactersWebService.dart';

class CharactersRepo {
  CharactersWebService? cWS;
  CharactersRepo(this.cWS);

  Future<List<Character>> getAllCharacters() async 
  {
    final characters = await cWS!.getAllCharacters();
    return characters;
  }
}
