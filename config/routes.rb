Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'

  resources :students, only: [:create, :index, :show, :destroy, :update] do
    member do
      get 'teachers_details'
    end
  end

  resources :teachers, only: [:create, :index, :show, :destroy] do
    member do
      get 'students_details'
    end
  end

  resources :subjects, only: [:create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
