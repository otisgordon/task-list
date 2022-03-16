# == Schema Information
#
# Table name: spotify_accounts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SpotifyAccount < ApplicationRecord
  serialize(:spotify_info)
end
