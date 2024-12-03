import 'package:breaking_bad/Data/Models/Character.dart';
import 'package:breaking_bad/constants/MyCololrs.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: false,
      backgroundColor: Mycololrs.MyGry,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
          style: const TextStyle(color: Mycololrs.MyWhite),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charID,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget builDevider(double endindent) {
    return Divider(
      color: Mycololrs.MyYellow,
      height: 30,
      endIndent: endindent,
      thickness: 3,
    );
  }

  Widget characterInfo(String titel, String value) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: titel,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Mycololrs.MyWhite),
        ),
        TextSpan(
          text: value,
          style: TextStyle(fontSize: 16, color: Mycololrs.MyWhite),
        )
      ]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycololrs.MyGry,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('Job : ', character.jobs.splitMapJoin('/')),
                    builDevider(315),
                    
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
