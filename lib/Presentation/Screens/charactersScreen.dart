import 'package:bloc_demo/BusinessLogic/cubit/cubit/characters_cubit_cubit.dart';
import 'package:bloc_demo/Constants/colorsString.dart';
import 'package:bloc_demo/Data/Model/characterModel.dart';
import 'package:bloc_demo/Presentation/Widgets/Character_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = <Character>[];
  int length = 0;
  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    if (allCharacters != null) {
      length = allCharacters.length;
    }
    print("allcharacters: " + allCharacters.length.toString());
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<CharactersCubit, CharactersCubitState>(
      builder: (context, state) 
      {
        if (state is CharactersLoaded) 
        {
          allCharacters = state.characters;
          return charactersListView();
        } 

        else 
        {
          return loadingView();
        }
      },
    );
  }


   Widget loadingView() 
   {
     return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
   }

  Widget charactersListView() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: allCharacters.length,
                itemBuilder: (ctx, idx) 
                {
                  return CharacterTile(myCharacter: allCharacters[idx]);
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          title: Text('Hello'),
        ),
        body: buildBlocBuilder());
  }
}
