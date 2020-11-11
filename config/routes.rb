Rails.application.routes.draw do
  resources :sell_games
  devise_for :users
  root to: "pages#index"
  get 'pages/index' => 'pages#index'
  get 'search' => 'sell_games#search'
  get 'mygames' => 'sell_games#mygames'
end
