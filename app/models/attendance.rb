class Attendance < ActiveRecord::Base
  attr_accessible :student_id, :status, :created_at, :updated_at

  belongs_to :student
  belongs_to :lecture

  has_one :picture, as: :imageable

  validates_presence_of :student
  validates_presence_of :lecture
  validates :picture, presence: true

  validates :status, inclusion: { in: %w(warning absent late success) }

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
end
