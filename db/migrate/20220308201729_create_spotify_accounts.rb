class CreateSpotifyAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :spotify_accounts do |t|

      t.timestamps
    end
  end
end
