class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  attr_accessible :image_cache

  validates :imageable_id, presence: true
  validates :image, presence: true

  mount_uploader :image, PictureUploader

  after_save do |picture|
    if imageable_type == "Student"
      student = imageable
      client = Face.get_client(:api_key => 'da7eb16e392f446496608518995f4678', :api_secret => '954b9ac8bb944679b1b1d96443b4cb7b')
      res = client.faces_detect(:file => File.new(picture.image.file.file, "rb"))
      tid = res["photos"][0]["tags"][0]["tid"]
      uid = student.sin + "@aeap"
      Rails.logger.info tid
      Rails.logger.info uid
      res = client.tags_save(uid: uid, tids: [tid])
      Rails.logger.info res
      res = client.faces_train(uids: uid)
      Rails.logger.info res
    end
  end
end
