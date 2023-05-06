Rails.application.routes.draw do
  get 'current_singer/index'
  get 'current_singer', to: 'current_singer#index'
  get '/current_user', to: 'current_user#index'
  get '/current_company', to: 'current_company#index'
  devise_for :users, path: '/users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :companies, path: '/companies', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'companies/sessions',
    registrations: 'companies/registrations'
  }
  devise_for :singers, path: '/singers', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'singers/sessions',
    registrations: 'singers/registrations'
  }
  get 'concerts/:id/tikits', to: 'concerts#show_concert_tikits'
  get 'concerts/:id/tikits_count', to: 'concerts#show_concert_tikits_count'
  get 'concerts/:id/tikits_price', to: 'concerts#show_concert_tikits_price'
  resources :tikits
  resources :concerts
  resources :singers
  resources :venues
  resources :companies

end
