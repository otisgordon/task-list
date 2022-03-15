Rails.application.routes.draw do

  get("/", { :controller => "spotify_accounts", :action => "index" })


  # Routes for the Spotify account resource:

  # CREATE
  get '/auth/spotify/callback', to: 'spotify_accounts#spotify'
  get '/callback', to: 'spotify_accounts#spotify'
  get("/test", { :controller => "spotify_accounts", :action => "test" })
  get("/scrape", { :controller => "movies", :action => "scrape" })


  post("/insert_spotify_account", { :controller => "spotify_accounts", :action => "create" })
          
  # READ
  get("/spotify_accounts", { :controller => "spotify_accounts", :action => "index" })
  
  get("/spotify_accounts/:path_id", { :controller => "spotify_accounts", :action => "show" })
  
  # UPDATE
  
  post("/modify_spotify_account/:path_id", { :controller => "spotify_accounts", :action => "update" })
  
  # DELETE
  get("/delete_spotify_account/:path_id", { :controller => "spotify_accounts", :action => "destroy" })

  #------------------------------

  # Routes for the Movie resource:

  # CREATE
  post("/insert_movie", { :controller => "movies", :action => "create" })
          
  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  # UPDATE
  
  post("/modify_movie/:path_id", { :controller => "movies", :action => "update" })
  
  # DELETE
  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" })

  #------------------------------

  # Routes for the User :

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
