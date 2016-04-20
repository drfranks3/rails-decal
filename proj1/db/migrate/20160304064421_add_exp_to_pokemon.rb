class AddExpToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :EXP, :integer
  end
end
