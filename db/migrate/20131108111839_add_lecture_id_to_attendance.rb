class AddLectureIdToAttendance < ActiveRecord::Migration
  def up
    add_column :attendances, :lecture_id, :integer
    remove_column :attendances, :course_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
