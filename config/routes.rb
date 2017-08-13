Rails.application.routes.draw do
  root to: 'statics#index'

  devise_for :users, :controllers => {:registrations => "custom/registrations"}
  devise_for :admins, skip: [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
    delete 'admins' => 'devise/registrations#destroy', :as => 'destroy_admins_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins, except: [:edit,:update]
  resources :users, only: [:index,:show,:destroy]
  controller :statics do
    get 'requests', to: "statics#requests"
  end
end
