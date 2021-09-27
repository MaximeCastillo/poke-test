Rails.application.routes.draw do
  get '/', to: redirect('/api/v1/pokemons')
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get "/pokemons", to: "pokemons#index"
      get "/pokemons/:id", to: "pokemons#show"
    end
  end
end
