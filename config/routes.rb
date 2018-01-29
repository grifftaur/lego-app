Rails.application.routes.draw do
  devise_for :users
  resources :legopins do
    resources :buildtimes, only: %i[new create]
  end
  root to: 'legopins#index'
end
