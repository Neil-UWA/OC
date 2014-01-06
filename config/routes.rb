LearningApp::Application.routes.draw do
  get "users/signin"

	resources :users do 
		resources :posts
		#resources :comments
		#resources :likes
	end 
	
	resources :posts do
		resources :categories, only: :create
		resources :comments, only: :create
		resources :likes, only: :create
	end 

	resources :categories do 
		resources :posts
	end 

	get 'likes/create/:status', to: 'likes#create', as: 'vote'

	resources :sessions, only:[:create, :new, :destroy]
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'
	get 'signout', to: 'sessions#destroy', method: :delete

  root "home#index"
	get 'home', to:'home#index'
end
