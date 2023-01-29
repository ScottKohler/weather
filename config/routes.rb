Rails.application.routes.draw do
  resources :weathers
  get "searches" => "searches#search", as: :searches
  #get "searches/init" => "searches#init", as: :search_init
  get "searches/new" => "searches#new", as: :search_new

  post "searches" => "searches#search", as: :post_searches
end
