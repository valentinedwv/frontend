DplaPortal::Application.routes.draw do
  devise_for :users, controllers: {
    :registrations => "registrations",
    :confirmations => "confirmations",
    :sessions      => "sessions",
    :passwords     => "passwords"
  }

  scope 'about', as: :about, via: :get do
    match 'overview',       to: 'pages#overview'
    match 'leadership',     to: 'pages#leadership'
    match 'workstreams',    to: 'pages#workstreams'
    match 'for-developers', to: 'pages#for_developers', as: 'for_developers'
    match 'get-involved',   to: 'pages#get_involved',   as: 'get_involved'
    root to: redirect('/about/overview')
  end

  get '/item/:id',       to: 'items#show', as: 'item'
  get '/search',         to: 'search#list', as: 'search_items'

  resource :timeline, only: :show, controller: 'timeline' do
    post 'items_by_year'
  end

  resource :map, only: :show, controller: 'map' do
    get 'state'
    get 'items_by_spatial'
  end

  root to: 'pages#home'
  match '/welcome' => 'users#welcome'
end
