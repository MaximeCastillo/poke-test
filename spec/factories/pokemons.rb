FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |i| "Pokémon #{i}"}
  end
end
