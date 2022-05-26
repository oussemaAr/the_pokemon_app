import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_catcher/const.dart';
import 'package:pokemon_catcher/controler/pokemon.controller.dart';
import 'package:pokemon_catcher/widget/pokemon.widget.dart';

import '../model/pokemon.model.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _pokemonListState();
}

class _pokemonListState extends State<PokemonListScreen> {
  var controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    controller.updatePokemonList();
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Pokemon List"),
      ),
      body: Center(
        child: Container(
          child: Obx(() => showListView(controller.pokemonList)),
          // child: FutureBuilder(
          //   future: PokemonController().fetchPokemons(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<Pokemon> list = snapshot.data as List<Pokemon>;
          //       return showListView(list);
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // ),
        ),
      ),
    );
  }

  showListView(List<Pokemon> pokemonList) {
    print("UPDATED ${pokemonList.length}");
    return ListView.separated(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        var currentPokemon = pokemonList[index];
        return Dismissible(
          key: Key(currentPokemon.id!),
          onDismissed: ((direction) => {controller.removePokemon(index)}),
          child: PokemonWidget.pokemonWidget(
              currentPokemon.imageurl!,
              currentPokemon.name == null ? "" : currentPokemon.name!,
              currentPokemon.description == null
                  ? ""
                  : currentPokemon.description!,
              () => {
                    Get.defaultDialog(
                      title: pokemonList[index].name!,
                      middleText: pokemonList[index].description!,
                    )
                  }),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.white,
        );
      },
    );
  }
}
