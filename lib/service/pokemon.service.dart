import 'dart:convert';

import 'package:http/http.dart' as httpClient;
import 'package:pokemon_catcher/const.dart';
import 'package:pokemon_catcher/service/model/pokemonapi.model.dart';

class PokemonService {
  Future<List<PokemonApiModel>> fetchPokemons() async {
    var response = await httpClient
        .get(Uri.parse("${Consts.baseUrl}/b/62388171a703bb6749311ec7"));

    List<PokemonApiModel> result = List.from(jsonDecode(response.body)
        .map((pokemon) => PokemonApiModel.fromJson(pokemon)));

    return result;
  }
}
