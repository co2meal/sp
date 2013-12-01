class Attendance < ActiveRecord::Base
  attr_accessible :student_id, :status, :authenticated, :created_at, :updated_at

  belongs_to :student
  belongs_to :lecture

  has_one :picture, as: :imageable

  validates_presence_of :student
  validates_presence_of :lecture
  validates :picture, presence: true

  validates :status, inclusion: { in: %w(absent late success) }
  validates :authenticated, inclusion: { in: %w(warning success) }

  # Fill status
  before_validation(on: :create) do |atte|
    now = Time.now
    if atte.lecture.classtime - 15.minutes < now && now <= atte.lecture.classtime + 10.minutes
      atte.status = "success"
    elsif atte.lecture.classtime + 10.minutes < now && now <= atte.lecture.classtime + 30.minutes
      atte.status = "late"
    else
      atte.status = "absent"
    end
  end

  before_validation(on: :create) do |atte|
    atte.authenticated = "warning"

    confidences = nil
    5.times do
      if confidences.nil?
        begin
          client = Face.get_client(:api_key => 'da7eb16e392f446496608518995f4678', :api_secret => '954b9ac8bb944679b1b1d96443b4cb7b')
          uid = student.sin + "@aeap"
          url = "http://overpl.us:3000" + atte.picture.image.url
          Rails.logger.info "uids: #{uid}, urls: #{url}"
          res = client.faces_recognize(uids: [uid], urls: [url])
          Rails.logger.info "recognize res : #{res}"
          confidences = res["photos"].first["tags"].map {|tag| tag["uids"][0]["confidence"] }
          Rails.logger.info "confidences : #{confidences}"
        rescue
          Rails.logger.info "Model Attendance Rescued"
          sleep(1)
        end
      end
    end
    if confidences.nil?
      raise "Face communication error"
    end
    atte.authenticated = "success" if confidences.count { |c| c > 50 } > 0
  end
end
