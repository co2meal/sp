class Student < ActiveRecord::Base
  attr_accessible :name, :sin
  has_many :pictures, as: :imageable
  has_and_belongs_to_many :courses

end
