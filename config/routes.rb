Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  get '/', to: 'questions#index', as: :root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
