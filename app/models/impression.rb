class Impression < ActiveRecord::Base
  VALID_YOUTUBE_URL_REGEX = /\A.*youtube.*/  #メールアドレスフォーマットの検証（完璧な正規表現ではない）
  belongs_to :channel
  validates :url, presence: true, format: { with: VALID_YOUTUBE_URL_REGEX }
end