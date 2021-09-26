require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should persist a pokemon" do
    Pokemon.create(name: "Salamèche")
    expect(Pokemon.find_by(name: 'Salamèche').present?).to be true
  end
end
