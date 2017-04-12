Rails.application.routes.draw do
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

	root 'static_pages#home'

	resources :users
	resources :attractions
	post '/rides/new' => 'rides#new'
end