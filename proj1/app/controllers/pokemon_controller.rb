class PokemonController < ApplicationController

  def capture
    find().update(trainer_id: current_trainer.id)
    redirect_to ""
  end

  def damage
    pokemon = find()
    if pokemon.health > 0
      pokemon.update(health: pokemon.health - 10)
    end
    redirect_to :back
  end

  def heal
    pokemon = find()
    if pokemon.health < 100
      pokemon.update(health: pokemon.health + 10)
    end
    redirect_to :back
  end

  def find
    return Pokemon.find(params[:id])
  end

  def new
  end

  def create
    if (params.include?(:pokemon))
      submit = params[:pokemon]
      @pokemon = Pokemon.create name: submit[:name], trainer_id: current_trainer.id, level: 1, health: 100, EXP: 0
      if !@pokemon.errors.blank?
        flash[:error] = @pokemon.errors.full_messages.to_sentence
        redirect_to :back
      else
        redirect_to trainer_path(current_trainer.id)
      end
    end
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:name)
    end

end
