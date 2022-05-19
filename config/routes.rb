Rails.application.routes.draw do
  resources :issue_ancestries
  resources :epic_ancestries
  resources :board_ancestries
  resources :sub_epics
  resources :sub_boards
  resources :issues
  resources :epics
  resources :boards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
