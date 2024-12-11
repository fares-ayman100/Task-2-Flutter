import 'Business_Layer/cubit/character_cubit.dart';
import 'Data/Models/Character.dart';
import 'Data/Repositry/character_repositry.dart';
import 'Presentation/Screens/characterDetailsScreen.dart';
import 'Presentation/Screens/Characters_Screen.dart';
import 'constants/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/WebSercices/Character_Web_Services.dart';

class AppRouter {
  late CharacterRepositry characterRepositry;
  late CharacterCubit characterCubit;

  AppRouter() {
    characterRepositry =
        CharacterRepositry(characterWebServices: CharacterWebServices());
    characterCubit = CharacterCubit(characterRepositry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit,
            child: const CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharacterCubit(characterRepositry),
            child: const CharacterScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );
    }
    return null;
  }
}
