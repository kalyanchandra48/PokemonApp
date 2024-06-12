import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/home_page.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PokemonProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonHomePage(),
      ),
    );
  }
}
