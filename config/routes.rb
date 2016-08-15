Rails.application.routes.draw do
  resources :questions, except: [:edit] do
    resources :answers, except: [:index]
  end

  get '/', to: 'questions#index', as: :root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
