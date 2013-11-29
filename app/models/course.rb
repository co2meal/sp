# encoding: utf-8
class Course < ActiveRecord::Base
  attr_accessible :name, :timetable

  has_and_belongs_to_many :students

  has_many :lectures

  after_create do |c|
    day_to_daycode = ["일", "월", "화", "수", "목", "금", "토"]
    timecode_to_time = {
      "A" => 9.hours,
      "B" => 10.hours + 30.minutes,
      "C" => 12.hours,
      "D" => 13.hours + 30.minutes,
      "E" => 15.hours,
      "F" => 16.hours + 30.minutes
    }

    begin_date = DateTime.new(2013, 9, 1, 0,0,0, '+9')
    end_date   = DateTime.new(2013, 12, 31, 0,0,0, '+9')

    date = begin_date
    while date <= end_date
      c.timetable.split.each do |e|
        daycode = e[0]
        timecode = e[1]

        if daycode == day_to_daycode[date.strftime("%w").to_i]
          c.lectures.create(:classtime => date + timecode_to_time[timecode])
        end
      end
      date = date + 24.hours
    end
  end

  def current_lecture
    lectures.where("? < classtime AND classtime < ?", Time.now - 75.minutes, Time.now + 10.minutes).last
  end
end
