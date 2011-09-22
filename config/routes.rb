CancanDevise::Application.routes.draw do
  devise_for :job_seekers

  get "home/index"

  root :to => "home#index"
end
