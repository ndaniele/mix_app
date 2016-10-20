Rails.application.routes.draw do

root 'questions#index'
get '/questions/most_popular' => 'questions#most_popular'
post '/questions/:question_id/answers' => 'answers#create'

get '/groups/my_groups' => 'groups#my_groups'

get 'questions/:id/question_data', to: 'questions#question_data'

#get '/questions/:question_id/answers/:id', to: 'answers#show', as: 'questions_:question_id_answer'
#get '/', to: 'questions#index', as: :root #=> maybe needs to be devise/sessions#new

#get '/login' => 'sessions#new'
#post '/sessions' => 'sessions#create'
#
#get '/logout' => 'sessions#destroy'
#
#get '/auth/:provider/callback' => 'sessions#create'


devise_scope :user do 
 get '/users/sign_out' => 'devise/sessions#destroy'
 get '/' => 'devise/sessions#new'
end

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :users, :only => [:show, :create, :new]

  resources :questions, :except => [:edit] do
    resources :answers, :only => [:show, :create, :new]
  end

  resources :groups do
    resources :memberships
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
