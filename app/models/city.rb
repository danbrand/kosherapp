class City < ActiveRecord::Base
  

  belongs_to :user

  has_many :restraunts
  
  mount_uploader :image, ImageUploader


end
