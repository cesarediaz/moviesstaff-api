Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      get 'movies' => 'movies#index'
      get 'movies/:id' => 'movies#show'

      get 'people' => 'people#index'
      get 'people/:id' => 'people#show'
    end
  end

end
