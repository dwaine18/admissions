Rails.application.routes.draw do
  get 'users/index'
  # get 'pages/home'
  get 'about', to: 'pages#about'
  get 'pages/error'
  get 'pages/contact'
  get 'dashboard', to: 'students#dashboard'
  get 'adminDash', to: 'pages#adminDash'
  get 'is_admin', to: 'adcoms#is_admin'

  match '/users',   to: 'users#index',   via: 'get'
  
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, controllers: { registrations: "registrations" }
  resources :schools, :adcoms, :programs, :students, :student_apps, :users
  
  
  root 'pages#home'


  


  # get 'applications/new'
  # get 'applications/edit'
  # get 'schools/new'
  # get 'schools/show'
  # get 'schools/edit'
  # get 'adcoms/show'
  # get 'adcoms/new'
  # get 'adcoms/edit'
  # get 'programs/show'
  # get 'programs/new'
  # get 'programs/edit'
  # get 'adcom/show'
  # get 'adcom/new'
  # get 'adcom/edit'
  # get 'students/show'
  # get 'students/new'
  # get 'students/edit'
  # get 'student_apps/show'
  # get 'student_apps/new'
  # get 'student_apps/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
