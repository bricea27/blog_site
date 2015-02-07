Rails.application.routes.draw do

  root 'entries#index'
  resources :entries

  get '/login' => 'session#new'
  post '/session' => 'session#create'

  # scope 'admin' do
  #   resources :entries
  # end

  get '/admin' => 'admin#show'

  delete '/session' => 'session#destroy'

end
