Rails1::Application.routes.draw do

  resources :posts do
    resources :comments
  end


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

end
