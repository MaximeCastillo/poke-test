Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get "/pokemons", to: "pokemons#index"
      get "/pokemons/:id", to: "pokemons#show"
    end
  end
end
