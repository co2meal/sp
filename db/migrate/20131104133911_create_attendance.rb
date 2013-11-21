class CreateAttendance < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :status
      t.references :student
      t.references :course
      t.timestamps
    end
  end
end
