Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:resgistrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admins_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admins_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :admins, except: [:edit,:update]
end
