Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'say_hello', to: 'api/v1/customers#say_hello'

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :create]
      resources :teas, only: [:index]
    end
  end
end
