import 'package:bloc_demo/Constants/colorsString.dart';
import 'package:bloc_demo/Data/Model/characterModel.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Character myCharacter;

  const CharacterTile({Key? key, required this.myCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: MyColors.myGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: myCharacter.img.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'Assets/Images/loading.gif',
                  image: myCharacter.img,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset('Assets/Images/placeholder.png'),
        ),
        footer: Container(
         
          width: double.infinity,
          color: MyColors.myYellow,
          child: Text(myCharacter.name, textAlign:   TextAlign.center,),
        ),
      ),
    );
  }
}
