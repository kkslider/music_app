MusicApp::Application.routes.draw do
  resources :users do
    collection do
      get 'activate'
    end
  end
  
  resource :session
  
  resources :bands do
    resources :albums, :only => [:index, :new, :create]
  end
  
  resources :albums, :only => [:show, :edit, :update, :destroy] do
    resources :tracks, :only => [:index, :new, :create] 
  end
  
  resources :tracks, :only => [:show, :edit, :update, :destroy] do
    resources :notes, :only => [:new, :create, :destroy]
  end
end
