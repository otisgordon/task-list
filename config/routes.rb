Rails.application.routes.draw do

  get("/", { :controller => "spotify_accounts", :action => "test" })


  # Routes for the Spotify account resource:

  # CREATE
  get '/auth/spotify/callback', to: 'spotify_accounts#spotify_users'
  get '/callback', to: 'spotify_accounts#spotify_users'
  get("/movies", { :controller => "spotify_accounts", :action => "spotify" })
  get("/options", { :controller => "spotify_accounts", :action => "options" })
  get("/home", { :controller => "spotify_accounts", :action => "test" })
  get("/scrape", { :controller => "movies", :action => "scrape" })



end
