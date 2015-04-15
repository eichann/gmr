class Impression < ActiveRecord::Base
  VALID_YOUTUBE_URL_REGEX = /\A.*youtube.*/
  belongs_to :channel
  validates :url, presence: true, format: { with: VALID_YOUTUBE_URL_REGEX }
end