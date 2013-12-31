LearningApp::Application.routes.draw do

  get "users/signin"

	resources :users do 
		resources :posts
	end 

	resources :sessions, only:[:create, :new, :destroy]

  root "home#index"

	get 'home', to:'home#index'
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'


end
