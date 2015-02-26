Rails.application.routes.draw do

  # Accounting
  get 'accounting', to: 'accounting#index'

  # Accounts
  resources :accounts

  # Activities
  resources :activities

  # Authentication
  get  'login',  to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  # Contributions
  resources :contributions, except: :show

  # Contribution types
  resources :contribution_types, except: :show

  # Expenses
  resources :expenses

  # Exports
  get 'exports', to: 'exports#index'

  # Incomes
  resources :incomes
  
  # Members
  resources :members do
    collection do
      get 'faces'
      get 'map'
    end
  end

  # Permissions
  get 'access_denied', to: 'permissions#access_denied'
  
  # Settings
  get  'association', to: 'settings#association'
  get  'settings',    to: 'settings#index'
  post 'settings',    to: 'settings#update'

  # Setup
  get  'setup', to: 'setup#new'
  post 'setup', to: 'setup#create'

  # Statuses
  resources :statuses, except: :show

  root 'members#index'

end
