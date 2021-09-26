require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should persist a pokemon" do
    Pokemon.create(name: "Salamèche")
  end
end
