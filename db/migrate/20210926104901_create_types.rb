class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.integer :pokeapi_id
      t.string :name

      t.timestamps
    end
  end
end
