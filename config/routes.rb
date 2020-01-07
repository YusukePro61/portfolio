Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :articles do
    resources :comments, only: [:create]
  end
  resources :mypages, only: [:show]
  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
