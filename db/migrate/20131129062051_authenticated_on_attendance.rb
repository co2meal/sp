class AuthenticatedOnAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :authenticated, :string
  end
end
