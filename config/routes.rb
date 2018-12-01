Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :courses
  resources :sections
  resources :students
  resources :enrollments

  root 'home#index'
end
