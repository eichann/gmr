class Channel < ActiveRecord::Base
  #association
  has_many :impressions
  validates :name, presence: true


  def enable_request!
    if enable_request
      self.enable_request = false
    else
      self.enable_request = true
    end
    save
  end

end
