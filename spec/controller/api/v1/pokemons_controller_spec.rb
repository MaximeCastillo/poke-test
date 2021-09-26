require 'rails_helper'

RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe "GET #index" do
    before do
      10.times do
        create(:pokemon)
      end
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response should contains all pokemons in db" do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to be(Pokemon.all.count)
    end

    it "JSON body response contains expected pokemons attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response[1]).to include("id", "name", "types")
    end
  end

  describe "GET #show" do
    before do
      3.times do
        create(:pokemon)
      end
      get :show, params: { id: Pokemon.first.id }
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected pokemon attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response).to include("id", "name", "types", "moves")
    end
  end
end
