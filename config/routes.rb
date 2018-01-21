Rails.application.routes.draw do

  devise_for :users
root to: 'legopins#index'

resources :legopins
end
