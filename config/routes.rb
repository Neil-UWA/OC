LearningApp::Application.routes.draw do

	resources :users
	resources :sessions, only:[:create, :new, :destroy]

  root "home#index"

	get 'home', to:'home#index'
	get 'signup', to: 'users#new'
	get 'signin', to: 'sessions#new'

end
