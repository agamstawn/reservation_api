Rails.application.routes.draw do
  # get 'guests/index'
  # get 'guests/create'
  # get 'guests/show'
  # get 'guests/update'
  # get 'guests/destroy'
  # get 'guests/change_reservation'
  # get 'reservations/index'
  # get 'reservations/create'
  # get 'reservations/show'
  # get 'reservations/update'
  # get 'reservations/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :guests do
    resources :phone_numbers
  end
    resources :reservations
end
