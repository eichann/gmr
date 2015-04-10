class Impression < ActiveRecord::Base
  belongs_to :channel
  validates :url, presence: true
end