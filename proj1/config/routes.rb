Rails.application.routes.draw do
  root to: 'home#index'
  patch "/capture" => "pokemon#capture"
  patch "/damage" => "pokemon#damage"
  patch "/heal" => "pokemon#heal"
  get "/pokemon/new" => "pokemon#new"
  post "/pokemon/new" => "pokemon#create"
  devise_for :trainers
  resources :trainers
end
