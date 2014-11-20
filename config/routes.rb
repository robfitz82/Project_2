Rails.application.routes.draw do

  root 'access#landing'
  
  get 'login', to: "access#login", as: 'login'

  get 'signup', to: "access#signup", as: 'signup'

  post 'login', to: "access#attempt_login"

  post 'signup', to: "access#create"

  get 'home', to: "access#home", as: 'home'

  get 'logout', to: "access#logout"

  get '/forgot' => 'access#forgot_password'
  post '/send_reset' => 'access#send_reset'
  get '/reset/:token' => 'access#reset_password'
  post '/update_password' => 'access#update_password'


  resources :categories

  resources :photos

  resources :users

end
