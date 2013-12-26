LearningApp::Application.routes.draw do

	resources :users

	match '/home', to: 'home#index', via: 'get'
  root "home#index"
end
