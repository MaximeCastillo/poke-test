# Poké Test
API Rails, basée sur l'API [PokéAPI](https://pokeapi.co/docs/v2), qui présente une liste de tous les pokémons connus (+ de 1000 !), ainsi que des caractéristiques plus détaillés pour chacun d'entre eux. Version en ligne accessible sur [poke-test-online.herokuapp.com](http://poke-test-online.herokuapp.com).

## Sommaire

- [Instructions](#Instructions)
- [Utilisation](#Utilisation)
- [Versions](#Versions)
- [Auteur(s)](#Auteur(s))

## Instructions
- `git clone https://github.com/MaximeCastillo/poke-test.git`
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails import:all` pour importer / mettre à jour tous les pokémons et leurs specs
- ou (à la place de `rails import:all`) :
  - step 1 `rails import:types` pour importer / mettre à jour les types (= les classes des pokémons (exemples: feu, eau...))
  - step 2 `rails import:moves` pour importer / mettre à jour les moves (= les attaques des pokémons)
  - step 3 `rails import:pokemons` pour importer / mettre à jour les pokémons
- `rails server`
- Go to http://localhost:3000

## Utilisation
- Sur [api/v1/pokemons](http://poke-test-online.herokuapp.com/api/v1/pokemons), on retrouve la liste de tous les pokémons avec leur id, name et types
```javascript
[
  {
    "id": 1,
    "name": "bulbasaur",
    "types": [
      {
        "id": 4,
        "name": "poison"
      },
      {
        "id": 12,
        "name": "grass"
      }
    ]
  },
  {
    "id": 2,
    "name": "ivysaur",
    "types": [
      {
        "id": 4,
        "name": "poison"
      },
      {
        "id": 12,
        "name": "grass"
      }
    ]
  },
...
]
```
- Sur [api/v1/pokemons/1](http://poke-test-online.herokuapp.com/api/v1/pokemons/1), on a un json plus détaillé sur les specs du pokémon en question, avec ses types mais aussi toutes ses attaques et leurs caractéristiques.
```javascript

  "id": 1,
  "name": "bulbasaur",
  "base_experience": 64,
  "height": 7,
  "weight": 69,
  "types": [
    {
      "id": 12,
      "name": "grass"
    },
    {
      "id": 4,
      "name": "poison"
    }
  ],
  "moves": [
    {
      "id": 13,
      "name": "razor-wind",
      "accuracy": 100,
      "effect_chance": null,
      "pp": 10,
      "priority": 0,
      "power": 80
    },
    {
      "id": 14,
      "name": "swords-dance",
      "accuracy": null,
      "effect_chance": null,
      "pp": 20,
      "priority": 0,
      "power": null
    },
    ...
  ]
```

## Versions
- Ruby ``2.7.1``
- Rails ``6.0.4``

## Auteur(s)
* [@MaximeCastillo](https://github.com/MaximeCastillo)
