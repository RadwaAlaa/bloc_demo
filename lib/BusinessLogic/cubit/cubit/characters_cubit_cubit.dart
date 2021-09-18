import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Data/Model/characterModel.dart';
import 'package:bloc_demo/Data/Repo/charactersRepo.dart';
import 'package:meta/meta.dart';

part 'characters_cubit_state.dart';

class CharactersCubit extends Cubit<CharactersCubitState> {
  final CharactersRepo charactersRepo;

  CharactersCubit(this.charactersRepo) : super(CharactersCubitInitial());

  List<Character> getAllCharacters() {
    late List<Character> myCharacters = <Character>[];

    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      myCharacters = characters;
    });
    return myCharacters;
  }
}
