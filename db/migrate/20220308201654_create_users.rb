class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :spotifytopsongs
      t.string :spotify_account

      t.timestamps
    end
  end
end
