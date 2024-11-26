import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad/Business_Layer/cubit/character_cubit.dart';
import 'package:breaking_bad/Data/Models/Character.dart';
import 'package:breaking_bad/Presentation/Widget/Character_Item.dart';
import 'package:breaking_bad/constants/MyCololrs.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          final characters = state.characters;
          return buildLoadedListWidget(characters);
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Mycololrs.MyYellow,
      ),
    );
  }

  Widget buildLoadedListWidget(List<Character> characters) {
    return SingleChildScrollView(
      child: Container(
        color: Mycololrs.MyGry,
        child: Column(
          children: [
            buildCharacterList(characters),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList(List<Character> characters) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      itemCount: characters.length,
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return CharacterItem(character: characters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycololrs.MyYellow,
        title: Center(
          child: const Text(
            'Characters',
            style: TextStyle(color: Mycololrs.MyGry, fontSize: 35),
          ),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
