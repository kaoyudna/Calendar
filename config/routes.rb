Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root "homes#top"
  resources :schedules, except:[:show] do
    resource :achievements, only:[:create, :update, :edit, :show]
    patch 'finish' => 'achievements#finish'
    collection do
      get 'month'
      get 'week'
    end
  end

end
