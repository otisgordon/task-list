class ApplicationController < ActionController::Base
  require 'rspotify'
  before_action(:load_current_user)
  RSpotify.authenticate("617a6814f63f4de6be98b264feae2ad0", "57434de19c404fe29773701e552083a6")

  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  

end
