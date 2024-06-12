import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pokemon_app/models/pokemon_info.dart';
import 'package:pokemon_app/pages/pokemon_detail_page.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/services/pokemon_services.dart';
import 'package:pokemon_app/styles/textstyles.dart';
import 'package:provider/provider.dart';

import '../models/pokemon_list_model.dart';

class PokemonHomePage extends StatelessWidget {
  const PokemonHomePage({super.key});
  static int initialOffset = 0;
  static int initialLimit = 40;

  @override
  Widget build(BuildContext context) {
    fetchProviders(int offset, int limit) async {
      await Provider.of<PokemonProvider>(context, listen: false)
          .fetchPokemons(offset, limit);
    }

    fetchProviders(initialOffset, initialLimit);

    List<PokeMonModel> pokemonList =
        Provider.of<PokemonProvider>(context, listen: true).pokemonss;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Pokemon App',
            style: headerTextStyle,
          ),
        ),
        body: NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              fetchProviders(initialLimit, initialOffset += 40);
            }
            return true;
          },
          child: ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  bool result = await InternetConnection().hasInternetAccess;
                  if (!result) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No internet connection'),
                      ),
                    );
                    return;
                  }
                  PokemonInfo pokemonInfo =
                      await PokemonServices().fetchPokemonInfo(index + 1);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PokemonDetailPage(
                      pokemonInfo: pokemonInfo,
                    );
                  }));
                },
                child: ListTile(
                  title: Text(
                    pokemonList[index].name.toString(),
                    style: normalTextStyle,
                  ),
                ),
              );
            },
          ),
        ));
  }
}
