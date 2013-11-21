class MakePicturePolimorphic < ActiveRecord::Migration
  def up
    change_table :pictures do |t|
      t.references :imageable, polymorphic: true
      # t.remove :student_id
    end
  end

  def down
    change_table :pictures do |t|
      t.remove_references :imageable, polymorphic: true
      t.column :student_id, :integer
    end
  end
end
