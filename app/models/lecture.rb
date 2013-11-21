class Lecture < ActiveRecord::Base
  attr_accessible :classtime
  belongs_to :course
  has_many :attendances
end
