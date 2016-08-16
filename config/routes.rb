Rails.application.routes.draw do

  resources :users, :only => [:new, :create]

  resources :questions, :except => [:edit] do
    resources :answers, :only => [:show, :create]
  end



  get '/', to: 'questions#index', as: :root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
