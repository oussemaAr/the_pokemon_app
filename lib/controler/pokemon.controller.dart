import 'package:get/state_manager.dart';
import 'package:pokemon_catcher/service/pokemon.service.dart';

import '../model/pokemon.model.dart';

class PokemonController extends GetxController {
  List<Pokemon> pokemonList = <Pokemon>[].obs;

  Future<List<Pokemon>> fetchPokemons() async {
    var service = PokemonService();
    var result = await service.fetchPokemons();
    return List.from(
      result.map(
        (pokemonApiModel) => Pokemon(
          id: pokemonApiModel.id,
          description: pokemonApiModel.xdescription,
          imageurl: pokemonApiModel.imageurl,
          name: pokemonApiModel.name,
        ),
      ),
    );
  }

  removePokemon(int index) {
    pokemonList.removeAt(index);
  }

  updatePokemonList() async {
    var service = PokemonService();
    var result = await service.fetchPokemons();
    pokemonList.addAll(
      List.from(
        result.map(
          (pokemonApiModel) => Pokemon(
            id: pokemonApiModel.id,
            description: pokemonApiModel.xdescription,
            imageurl: pokemonApiModel.imageurl,
            name: pokemonApiModel.name,
          ),
        ),
      ),
    );
  }
}
