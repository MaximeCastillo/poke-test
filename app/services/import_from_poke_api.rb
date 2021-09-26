class ImportFromPokeApi
  def pokemons
    puts "Checking for pokemons"
    pokemons_in_db = Pokemon.count
    pokemons_count = PokeApi.get(:pokemon).count
    pokemons_to_add = pokemons_count - pokemons_in_db
    puts "Total number of pokemons found online : #{pokemons_count}"
    if pokemons_to_add <= 0
      puts "Everything is up-to-date"
    else
      puts "New pokemons to add : #{pokemons_to_add}"
    end

    pokemons = PokeApi.get(pokemon: {limit: pokemons_count, offset: pokemons_in_db})
    counter = 0

    pokemons.results.each do |result|
      pokemon = PokeApi.get(pokemon: result.name)
      my_pokemon = Pokemon.new(
        pokeapi_id: pokemon.id,
        name: pokemon.name,
        base_experience: pokemon.base_experience,
        height: pokemon.height,
        weight: pokemon.weight
      )
      pokemon.types.each do |type|
        my_pokemon.types << Type.find_by(name: type.type.name)
      end
      pokemon.moves.each do |move|
        if Move.exists?(name: move.move.name)
          my_pokemon.moves << Move.find_by(name: move.move.name)
        end
      end
      my_pokemon.save
      if my_pokemon.persisted?
        counter += 1
        print "#{counter}/#{pokemons_to_add} imported : '#{my_pokemon.name}'" + " "*20 + "\r"
        print "\n" if counter == pokemons_to_add
      end
    end
    puts "#{counter} pokemons imported"
  end

  def types
    types_count = PokeApi.get(:type).count
    puts "Total number of types found online : #{types_count}"

    types = PokeApi.get(type: {limit: types_count, offset: Type.count})
    counter = 0

    types.results.each do |result|
      type = PokeApi.get(type: result.name)
      my_type = Type.new(
        pokeapi_id: type.id,
        name: type.name
      )
      my_type.save
      if my_type.persisted?
        puts "'#{my_type.name}' imported"
        counter += 1
      end
    end
    puts "#{counter} types imported"
  end

  def moves
    moves_in_db = Move.count
    moves_count = PokeApi.get(:move).count
    moves_to_add = moves_count - moves_in_db
    puts "Total number of moves found online : #{moves_count}"

    moves = PokeApi.get(move: {limit: moves_count, offset: Move.count})
    counter = 0

    moves.results.each do |result|
      move = PokeApi.get(move: result.name)
      my_move = Move.new(
        pokeapi_id: move.id,
        name: move.name,
        accuracy: move.accuracy,
        effect_chance: move.effect_chance,
        pp: move.pp,
        priority: move.priority,
        power: move.power,
      )
      my_move.save
      if my_move.persisted?
        counter += 1
        print "#{counter}/#{moves_to_add} imported : '#{my_move.name}'" + " "*20 + "\r"
        print "\n" if counter == moves_to_add
      end
    end
    puts "#{counter} moves imported"
  end

  def all
    if Pokemon.all.count < 50
      puts "Warning : if you execute this task for the first time, it could take more than 20 minutes"
      sleep 3
    end
    types
    moves
    pokemons
  end

end