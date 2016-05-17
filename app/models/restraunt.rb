class Restraunt < ActiveRecord::Base
  belongs_to :user

  belongs_to :city

  mount_uploader :restraunt_image, RestrauntImageUploader


end
