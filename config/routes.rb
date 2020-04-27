Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  root 'statics_pages#home'
  get 'dreams/index'
  get 'user_statuses/home'
  resources :records do
    resources :dream_posts, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
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
