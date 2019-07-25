Rails.application.routes.draw do
  resources :dicts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/callback' => 'itdict_bot#callback'
end
