import 'package:breaking_bad/Data/Models/Character.dart';
import 'package:breaking_bad/Presentation/Screens/characterDetailsScreen.dart';
import 'package:breaking_bad/constants/MyCololrs.dart';
import 'package:breaking_bad/constants/Strings.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.character,
  });
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Mycololrs.MyWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.charID,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                    height: 1.30,
                    fontSize: 16,
                    color: Mycololrs.MyWhite,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: Mycololrs.MyGry,
            child: character.image.isEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    placeholder: 'assets/Images/Loading.gif',
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/Images/defulat.jpg'),
          ),
        ),
      ),
    );
  }
}
