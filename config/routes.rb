Rails.application.routes.draw do
  devise_for :account, controllers: { sessions: 'account/sessions', registrations: 'account/registrations' }
  root 'courses#index'

  scope module: :courses, path: '/' do
    resources :courses, only: [:index, :show]
    get 'my-courses', action: 'my_courses'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
