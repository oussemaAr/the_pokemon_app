import 'package:flutter/material.dart';

class PokemonWidget {
  static Widget pokemonWidget(
    String image,
    String name,
    String description,
    Function() cardClick,
  ) {
    return InkWell(
      onTap: () {
        cardClick();
      },
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: Image.network(image),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
