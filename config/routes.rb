LearningApp::Application.routes.draw do

  get "users/signin"

	resources :users do 
		resources :posts do
			resources :categories, only: [:create, :update, :destroy]
		end 
	end 

	resources :sessions, only:[:create, :new, :destroy]
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'
	get 'signout', to: 'sessions#destroy', method: :delete

  root "home#index"
	get 'home', to:'home#index'
end
