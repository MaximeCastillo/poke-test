require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should persist a pokemon" do
    create(:pokemon)
    expect(Pokemon.count).to be > 0
  end
end
