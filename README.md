# Poké Test
API Rails, basée sur l'API [PokéAPI](https://pokeapi.co/docs/v2), qui présente une liste de tous les pokémons connus (+ de 1000 !), ainsi que des caractéristiques plus détaillés pour chacun d'entre eux. Version en ligne accessible sur [poke-test-online.herokuapp.com](http://poke-test-online.herokuapp.com/api/v1).

## Sommaire

- [Instructions](#Instructions)
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

## Versions
- Ruby ``2.7.1``
- Rails ``6.0.4``

## Auteur(s)
* [@MaximeCastillo](https://github.com/MaximeCastillo)
