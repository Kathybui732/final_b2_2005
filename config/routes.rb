Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/passengers/:id", to: 'passengers#show'
  resources :passengers, only: [:show]

  # get "/flights/:id", to: 'flights#show'
  resources :flights, only: [:show]

  post "/passengers/:passenger_id/flight_passengers", to: 'flight_passengers#create'
end
