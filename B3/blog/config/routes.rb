Rails.application.routes.draw do
  resources :admins
  resources :posts do
    resources :comments
  end
  root 'welcome#index'
  get '/show/:id', to: 'welcome#show',as: 'wshow'
  get '/login',to: 'admins#login',as:'login'
  post '/passed/:id', to: 'comments#passed',as: 'passed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
