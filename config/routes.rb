Rails.application.routes.draw do
  resources:books
  root 'books#index'
  root 'books#show'
end
