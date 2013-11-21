class AddTimetableToCourse < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.string :timetable
    end
  end
end
