class Channel < ActiveRecord::Base
  #association
  has_many :impressions
  #callback
  # after_create :redirect_to_channel

  # private
  # def redirect_to_channel
  #   Main.redirect_to "/channels/#{id}"
  # end

end
