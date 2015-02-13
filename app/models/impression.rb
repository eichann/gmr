class Impression < ActiveRecord::Base
  validates :url, presence: true
  validate :add_error_message

  def add_error_message
    if url.empty?
      errors.add(:name, "oh, plz tell me your recommend!!")
    end
  end
end
