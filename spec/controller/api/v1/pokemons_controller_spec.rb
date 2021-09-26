require 'rails_helper'
RSpec.describe Api::V1::PokemonsController, type: :controller do
  describe "GET #index" do
    Pokemon.create(
      name: "Salamèche",
      base_experience: 200,
      height: 80,
      weight: 25
    )
    before do
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected pokemon attributes" do
      json_response = JSON.parse(response.body)[0]
      expect(json_response.length).to be > 1
      expect(json_response).to include("id", "name", "types")
    end
  end
end
