Rails.application.routes.draw do
  get 'dreams/index'

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics_pages#home'
  resources :records do
    resources :dream_posts, only:[:create, :destroy]
    collection do
      get 'form1'
      get 'form2'
      get 'form3'
      get 'form4'
      get 'done'
    end
  end
  resources :dreams, only:[:show, :index]
end
