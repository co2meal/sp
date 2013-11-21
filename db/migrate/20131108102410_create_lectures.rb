class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.references :course
      t.datetime :classtime
      t.timestamps
    end
  end
end
