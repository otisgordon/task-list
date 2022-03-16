Rails.application.routes.draw do

  get("/", { :controller => "spotify_accounts", :action => "index" })


  # Routes for the Spotify account resource:

  # CREATE
  get '/auth/spotify/callback', to: 'spotify_accounts#spotify'
  get '/callback', to: 'spotify_accounts#spotify'
  get("/options", { :controller => "spotify_accounts", :action => "options" })
  get("/test", { :controller => "spotify_accounts", :action => "test" })
  get("/scrape", { :controller => "movies", :action => "scrape" })



end
