Rails.application.routes.draw do
  root 'home#index'
  post '/search' => 'home#search'
  post '/romance' => 'home#romance'
  post '/magic' => 'home#magic'
  post '/mystery' => 'home#mystery'
  post '/comedy' => 'home#comedy'
  post '/scifi' => 'home#scifi'
  post '/action' => 'home#action'
  post '/adventure' => 'home#adventure'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
