Rails.application.routes.draw do
get '/', to: 'questions#index', as: :root

get '/login' => 'sessions#new'
post '/sessions' => 'sessions#create'

get '/logout' => 'sessions#destroy'

get '/auth/:provider/callback' => 'sessions#create'


  resources :users, :only => [:new, :create, :show]

  resources :questions, :except => [:edit] do
    resources :answers, :only => [:show, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
