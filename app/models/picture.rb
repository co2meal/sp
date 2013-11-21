class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  attr_accessible :image_cache

  validates :imageable_id, presence: true
  validates :image, presence: true

  mount_uploader :image, PictureUploader
end
