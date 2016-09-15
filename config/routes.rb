Rails.application.routes.draw do
  get 'graph/index'
  root 'graph#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
