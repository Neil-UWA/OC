LearningApp::Application.routes.draw do
  get "users/signin"

	resources :users do 
		resources :posts
		resources :comments
	end 
	
	resources :posts do
		resources :categories, only: [:create, :update, :destroy]
		resources :comments
	end 

	resources :posts
	resources :comments

	resources :sessions, only:[:create, :new, :destroy]
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'
	get 'signout', to: 'sessions#destroy', method: :delete

  root "home#index"
	get 'home', to:'home#index'
end
