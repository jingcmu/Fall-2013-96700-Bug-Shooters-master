PET::Application.routes.draw do
  get "users/new"

  resources :deliverables

  # add user page into route table
  resources :users

  resources :adhoc_deliverables

  resources :sessions, only: [:new, :create, :destroy]

  resources :projects

  match '/projects_assign/:uid' => "projects#assign"

  match '/projects_assign/user_id/:uid/project_id/:project_id' => "projects#assign_project"

  match '/project_phases/project_id/:project_id/lifecycle_phase_id/:lifecycle_phase_id/show/' => "project_phases#show"

  match '/deliverables/project_id/:project_id/lifecycle_phase_id/:lifecycle_phase_id/deliverable_type_id/:deliverable_type_id/new/' => "deliverables#new"

  match '/adhoc_deliverables/project_id/:project_id/lifecycle_phase_id/:lifecycle_phase_id/deliverable_type_id/:deliverable_type_id/new/' => "adhoc_deliverables#new"


  match '/deliverables/deliverable_id/:deliverable_id/actual_effort/:actual_effort/log/' => "deliverables#log"

  match '/deliverables/project_id/:project_id' => "deliverables#index"

  get '/historical_data/index'
  root to: 'static_pages#home'
  match '/help', to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'

  # route for user model
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy'


  #get "project_phases/show"
  get "deliverables/index"
end
