Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :companies

  namespace :api do

    namespace :v1 do
      post 'driver/register', to: 'drivers#register'
      post 'driver/:driver_id/sendLocation', to: 'locations#send_location'
      post 'passenger/available_cabs', to: 'locations#available_cabs'
    end

  end
end