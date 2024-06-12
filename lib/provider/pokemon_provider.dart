import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pokemon_app/models/pokemon_list_model.dart';
import 'package:pokemon_app/services/pokemon_services.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonServices pokemonServices = PokemonServices();
  List<PokeMonModel> pokemons = [];
  List<PokeMonModel> get pokemonss => pokemons;

  void addPokemon(PokeMonModel pokemon) {
    if (!pokemons.contains(pokemon)) {
      pokemons.add(pokemon);
      notifyListeners();
    }
  }

  Future<void> fetchPokemons(
    int offset,
    int limit,
  ) async {
    bool result = await InternetConnection().hasInternetAccess;
    if (!result) {
      return;
    }
    PokemonListModel pokemonListModel =
        await pokemonServices.fetchPokemons(offset, limit);
    if (pokemonListModel.results != null) {
      for (var element in pokemonListModel.results!) {
        addPokemon(element);
      }
    }
  }
}
