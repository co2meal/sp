class Lecture < ActiveRecord::Base
  attr_accessible :classtime, :course_id
  belongs_to :course
  has_many :attendances
end
