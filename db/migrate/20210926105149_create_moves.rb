class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.integer :pokeapi_id
      t.string :name
      t.integer :accuracy
      t.integer :effect_chance
      t.integer :pp
      t.integer :priority
      t.integer :power

      t.timestamps
    end
  end
end
