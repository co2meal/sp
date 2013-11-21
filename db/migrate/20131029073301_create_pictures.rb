class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :student

      t.timestamps
    end
  end
end
