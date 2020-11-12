Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %i[show index create]
end
