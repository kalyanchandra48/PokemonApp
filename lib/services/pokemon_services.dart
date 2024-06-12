import 'package:http/http.dart' as http;
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/models/pokemon_info.dart';
import 'package:pokemon_app/models/pokemon_list_model.dart';

class PokemonServices {
  static final PokemonServices _instance = PokemonServices.internal();
  factory PokemonServices() => _instance;
  PokemonServices.internal();

  Future<PokemonListModel> fetchPokemons(
    int offset,
    int limit,
  ) async {
    final pokemonListwithOffset = '$pokemonListUrl?offset=$offset&limit=$limit';

    final response = await http.get(Uri.parse(pokemonListwithOffset));
    if (response.statusCode == 200) {
      return PokemonListModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  Future<PokemonInfo> fetchPokemonInfo(int id) async {
    final pokemonInfoUrl = '$pokemonListUrl/$id';

    final response = await http.get(Uri.parse(pokemonInfoUrl));
    if (response.statusCode == 200) {
      return PokemonInfo.fromJson(response.body);
    } else {
      throw Exception('Failed to load pokemon info');
    }
  }
}
