class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :pokeapi_id
      t.string :name
      t.integer :base_experience
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
