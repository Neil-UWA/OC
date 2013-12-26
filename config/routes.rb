LearningApp::Application.routes.draw do

	resources :users

  root "home#index"
	match '/home', to: 'home#index', via: 'get'
end
