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
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more
    # user = User.find_or_create_by({ :spotify_info => spotify_user.to_hash })

    # Access private data
    spotify_user.country #=> "US"
    spotify_user.email   #=> "example@email.com"

    # Get user's top played artists and tracks
    @topartists = spotify_user.top_artists(time_range: 'short_term') #=> (Artist array)
    @toptracks = spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)

    @artistarray = Array.new
    @posterarray = Array.new

    @topartists.each do |item|
      plusname = item.name.gsub(" ", " ")
      @artistarray.push(plusname)
    end
    
    @returnedscrape = Array.new
    @newscrape = Array.new
    @artistarray.first(5).each do |song|
      @song = song
      # For each of the songs in the artist array, go do ferrum browser
      browser = Ferrum::Browser.new
      coolurl = browser.go_to("https://www.what-song.com/")
      input = browser.at_css('.SearchDropdown_mainSearchInput__u_rA8')
      input.focus.type(song)
      browser.wait_for_reload(3)
      dropdown = browser.at_css('.SearchDropdown_typeLink__1RIWf')
      @newurl = dropdown.attribute(:href)
      browser.quit

      @url = "https://www.what-song.com" + @newurl
      @webpage = HTTP.get(@url)
      @parsed_page = Nokogiri::HTML(@webpage.body.to_s)
      @links = @parsed_page.css(".ArtistSongCard_movieTitle__3Bx0u")
      @rightposter = @parsed_page.css(".ArtistSongCard_moviePoster__14LFP")
      
      # This is getting the posterpath to big Theif
      @rightposter.first(5).each do |posterpath|
        meep = posterpath.attribute('src').text
        @posterarray.push(meep)
      end 

      # This is getting the movie thats associated with it
      @links.first(5).each do |songwithmovies|
        @movieshow = songwithmovies.text.split("•")[0]
        @returnedscrape.push(@movieshow)
      end
      
    end

    render({ :template => "movies/scrape.html.erb" }) 
  end

end