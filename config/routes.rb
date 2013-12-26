LearningApp::Application.routes.draw do

	resources :users

  get "home/index"
  root "home#index"
end
