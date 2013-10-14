MusicApp::Application.routes.draw do
  resources :users, :bands, :albums, :tracks
  resource :session
end
