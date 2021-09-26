namespace :import do
  desc "Import all usefull data from PokeApi"
  task all: :environment do
    ImportFromPokeApi.new.all
  end

  desc "Import pokemons from PokeApi"
  task pokemons: :environment do
    ImportFromPokeApi.new.pokemons
  end

  desc "Import types from PokeApi"
  task types: :environment do
    ImportFromPokeApi.new.types
  end

  desc "Import moves from PokeApi"
  task moves: :environment do
    ImportFromPokeApi.new.moves
  end
end
