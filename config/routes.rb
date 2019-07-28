Rails.application.routes.draw do
  resources :dicts
  post '/callback' => 'itdict_bot#callback'
end
