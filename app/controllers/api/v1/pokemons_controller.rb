class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  # GET /pokemons
  def index
    @pokemons = Pokemon.includes(:types).all.select(:id, :name)

    render json: @pokemons.as_json(
      include: {
        types: {
          except: [:pokeapi_id, :created_at, :updated_at]
        }})
  end

  # GET /pokemons/1
  def show
    render json: @pokemon.as_json(
      include: {
        types: {
          except: [:pokeapi_id, :created_at, :updated_at]
        },
        moves: {
          except: [:pokeapi_id, :created_at, :updated_at]
        }},
      except: [:pokeapi_id, :created_at, :updated_at]
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end
end
