Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, skip: [:registrations]
  
  get 'reload_seed', to: 'home#reload_seed', as: :reload
  resources :people
  resources :movies

  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      get 'movies' => 'movies#index'
      get 'movies/:id' => 'movies#show'

      get 'people' => 'people#index'
      get 'people/:id' => 'people#show'
    end
  end

end
