class SpotifyAccountsController < ApplicationController

before_action(:force_user_sign_in, {:only => [:index,:show]})

  def index
      matching_spotify_accounts = SpotifyAccount.all

      @list_of_spotify_accounts = matching_spotify_accounts.order({ :created_at => :desc })

      render({ :template => "spotify_accounts/index.html.erb" })
    
  end

  def show
    the_id = params.fetch("path_id")

    matching_spotify_accounts = SpotifyAccount.where({ :id => the_id })

    @the_spotify_account = matching_spotify_accounts.at(0)

    render({ :template => "spotify_accounts/show.html.erb" })
  end

  def create
    the_spotify_account = SpotifyAccount.new

    if the_spotify_account.valid?
      the_spotify_account.save
      redirect_to("/spotify_accounts", { :notice => "Spotify account created successfully." })
    else
      redirect_to("/spotify_accounts", { :alert => the_spotify_account.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_spotify_account = SpotifyAccount.where({ :id => the_id }).at(0)


    if the_spotify_account.valid?
      the_spotify_account.save
      redirect_to("/spotify_accounts/#{the_spotify_account.id}", { :notice => "Spotify account updated successfully."} )
    else
      redirect_to("/spotify_accounts/#{the_spotify_account.id}", { :alert => the_spotify_account.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_spotify_account = SpotifyAccount.where({ :id => the_id }).at(0)

    the_spotify_account.destroy

    redirect_to("/spotify_accounts", { :notice => "Spotify account deleted successfully."} )
  end

  def test
    render({ :template => "spotify_accounts/test.html.erb" })
  end

  def spotify
    @accounts = Spotify::Accounts.new
    @accounts.client_id = "spotify client ID"
    @accounts.client_secret = "spotify client secret"
    @accounts.redirect_uri = "redirect URI"
    @accounts.authorize_url({
      scope: "user-read-private user-read-email user-top-read"
    })
    
    redirect_to("/", { :notice => "Hi!"} )
  end

end
