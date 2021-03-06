Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, except: %i[destroy] do
    resources :doses, only: %i[create]
    resources :reviews, only: %i[create]
  end
  resources :doses, only: %i[destroy]
end
