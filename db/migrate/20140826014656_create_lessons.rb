class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :desription
      t.float :time
      t.string :short_description

      t.timestamps
    end
  end
end
