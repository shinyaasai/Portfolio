Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics_pages#home'
  resources :records do 
    collection do
      get 'form1'
      get 'form2'
      get 'form3'
      get 'form4'
      get 'done'
    end
  end
end
