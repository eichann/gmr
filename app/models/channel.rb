class Channel < ActiveRecord::Base
  #association
  has_many :impressions
  validates :name, presence: true
  validates :description, length: { maximum: 140 }

  mount_uploader :image, ImageUploader


  def enable_request!
    if enable_request
      self.enable_request = false
    else
      self.enable_request = true
    end
    save
  end

end
