Rails.application.routes.draw do
  get '/agenda/:name' => 'agenda#index'
  post '/agenda/' => 'agenda#create'
  put '/agenda/:id' => 'agenda#update'
  delete '/agenda/:id' => 'agenda#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
