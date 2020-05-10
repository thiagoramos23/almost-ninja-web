Rails.application.routes.draw do
  devise_for :account, controllers: { sessions: 'account/sessions', registrations: 'account/registrations' }
  root 'course/courses#index'

  scope module: 'course' do
    get 'my-courses',    to: 'courses#my_courses'
    post 'start-course', to: 'courses#start_course'

    resources :courses, only: [:index, :show] do
      resources :lectures, only: [:index, :show]
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
