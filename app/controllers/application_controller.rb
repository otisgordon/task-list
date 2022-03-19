class ApplicationController < ActionController::Base
  require 'rspotify'
  RSpotify.authenticate("617a6814f63f4de6be98b264feae2ad0", "57434de19c404fe29773701e552083a6")
  def home
    render({ :template => "spotify_accounts/test.html.erb"})
  end


end
