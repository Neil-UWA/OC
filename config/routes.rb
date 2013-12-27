LearningApp::Application.routes.draw do

	resources :users

  root "home#index"
	get 'home', to:'home#index'

end
