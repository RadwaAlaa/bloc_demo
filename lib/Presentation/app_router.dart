import 'package:bloc_demo/BusinessLogic/cubit/cubit/characters_cubit_cubit.dart';
import 'package:bloc_demo/Constants/Routes.dart';
import 'package:bloc_demo/Data/WebService/charactersWebService.dart';
import 'package:bloc_demo/Presentation/Screens/charactersScreen.dart';
import 'package:bloc_demo/Presentation/Screens/charactersDetailsScreen.dart';
import 'package:bloc_demo/Data/Repo/charactersRepo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  Route? generateRoute(RouteSettings settings) {
    charactersRepo = CharactersRepo(CharactersWebService());
    charactersCubit = CharactersCubit(charactersRepo);

    switch (settings.name) {
      case CharactersPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharactersCubit(charactersRepo),
                  child: CharactersScreen(),
                ));

      case CharactersDetailsPage:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());

      default:
    }
  }
}
