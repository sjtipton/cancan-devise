CancanDevise::Application.routes.draw do
  devise_for :job_seekers

  root :to => "home#index"
end
