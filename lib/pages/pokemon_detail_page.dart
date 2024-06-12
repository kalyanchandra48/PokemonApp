import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_info.dart';
import 'package:pokemon_app/styles/textstyles.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonInfo pokemonInfo;
  const PokemonDetailPage({super.key, required this.pokemonInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pokemonInfo.name.toString(),
            style: headerTextStyle,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(pokemonInfo.imageUrl.toString()),
              ),
            ),
            commomnTextStyle('Name:', '  ${pokemonInfo.name}'),
            commomnTextStyle('Height:', '  ${pokemonInfo.height}'),
            commomnTextStyle('Weight:', '  ${pokemonInfo.weight}'),
            const Text('Types:', style: headerTextStyle),
            pokemonInfo.types!.isEmpty
                ? const Text('No types')
                : Column(
                    children: pokemonInfo.types!.map((e) {
                      return Text(e.type!.name.toString(),
                          style: normalTextStyle);
                    }).toList(),
                  ),
          ],
        ));
  }

  RichText commomnTextStyle(String text1, String text2) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: text1, style: headerTextStyle),
          TextSpan(text: text2, style: normalTextStyle),
        ],
      ),
    );
  }
}
