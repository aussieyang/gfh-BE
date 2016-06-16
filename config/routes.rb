Rails.application.routes.draw do

  # #dishes is the controller; index is the method - see dishes_controller.rb
  # get '/' => 'dishes#index'
  #
  # get '/dishes/new' => 'dishes#new'
  #
  # post '/dishes' => 'dishes#create'
  #
  # get '/dishes/:id' => 'dishes#show'
  #
  # get '/dishes/:id/edit' => 'dishes#edit'
  #
  # patch '/dishes/:id' => 'dishes#update'
  #
  # delete '/dishes/:id' => 'dishes#delete'

  get '/' => 'pages#home'

  get '/login' => 'session#new'

  post '/login' => 'session#create'

  get '/dishes/:id' => 'pages#show_dish'

  post '/comments' => 'comments#create'

  delete '/comments' => 'comments#delete'

namespace :admin do

  resources :dishes #does what above lines do automatically
  # use , only: [:view] or , except: [:view] to get subset

  # get '/' => 'dishes#index' end #only one not generated

  resources :users

  resources :likes

  get '/dashboard' => 'dashboard#index'

  root 'dashboard#index'

  # post '/likes/:id' => 'likes#new'

  end

  namespace :api do
    resources :dishes do
      resources :likes, only: [:create]
    end
  end

  # post '/api/dishes/:id/likes' => ''

end
