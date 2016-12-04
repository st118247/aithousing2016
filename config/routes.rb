Rails.application.routes.draw do

  get 'home/public'

#<<<<<<< HEAD
  get 'home/managehousingdetail'

  resources :housing_details
#=======
  resources :room_histories
  resources :room_managements
#>>>>>>> d8192f3c6599be352830e3f9d6a79902d3bd9fe4
  get 'administration/userlist'
  get 'administration/banuser'
  get 'administration/activeuser'
  post 'administration/assignrole'
  get 'administration/statistics'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  root 'home#index'
  get 'home/index'

  post 'home/btn_approve'
  post 'home/btn_reject'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
