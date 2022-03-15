# == Schema Information
#
# Table name: movies
#
#  id               :integer          not null, primary key
#  description      :string
#  songinsoundtrack :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Movie < ApplicationRecord
  belongs_to(:user, { :class_name => "User", :foreign_key => "user_id" })
end
