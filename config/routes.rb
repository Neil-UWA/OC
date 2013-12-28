LearningApp::Application.routes.draw do

  get "users/signin"
	resources :users

  root "home#index"
	get 'home', to:'home#index'

end
