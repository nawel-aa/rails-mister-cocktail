Rails.application.routes.draw do
  root to: 'cocktails#index'

  resources :cocktails, only: %i[show index create] do
    resources :doses, only: :create
  end
  resources :doses, only: :destroy
  get '/cocktails/:id/doses', to: 'cocktails#show'
end
