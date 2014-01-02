LearningApp::Application.routes.draw do

  get "users/signin"


	resources :posts

	resources :users do 
		resources :posts
	end 
	
	resources :pots do
		resources :categories, only: [:create, :update, :destroy]
	end 

	resources :sessions, only:[:create, :new, :destroy]
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'
	get 'signout', to: 'sessions#destroy', method: :delete

  root "home#index"
	get 'home', to:'home#index'
end
